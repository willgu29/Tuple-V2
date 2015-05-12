//
//  Parse.m
//  Tuple-V2
//
//  Created by William Gu on 5/12/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "ParseDatabase.h"

@implementation ParseDatabase

-(void)getContent
{
    PFUser *user = [PFUser currentUser];
    NSArray *groups = user[@"groups"];
    
    NSArray *groupDummy = @[@"BAB",@"EVERYONE"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Content"];
    [query whereKey:@"group" containedIn:groupDummy];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            [_delegate contentFetched:objects];
        } else {
            [_delegate contentError:error];
        }
    }];
}

-(NSArray *)getCurrentUserGroups
{
    PFUser *user = [PFUser currentUser];
    NSArray *groups = user[@"groups"];
    
    return @[@"EVERYONE",@"BAB"];
}


+ (instancetype)shared
{
    static ParseDatabase *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ParseDatabase alloc] init];
    });
    return _instance;
}


@end
