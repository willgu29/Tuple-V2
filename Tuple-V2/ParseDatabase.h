//
//  Parse.h
//  Tuple-V2
//
//  Created by William Gu on 5/12/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@protocol ParseDelegate <NSObject>

-(void)contentFetched:(NSArray *)content;
-(void)contentError:(NSError *)error;
@end

@interface ParseDatabase : NSObject

@property (nonatomic, assign) id delegate;
-(void)getContent;
-(NSArray *)getCurrentUserGroups;
+(instancetype)shared;

@end
