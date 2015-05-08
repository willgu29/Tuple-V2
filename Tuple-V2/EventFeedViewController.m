//
//  EventFeedViewController.m
//  Tuple-V2
//
//  Created by William Gu on 5/7/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EventFeedViewController.h"
#import "CreateEventViewController.h"

@interface EventFeedViewController ()

@end

@implementation EventFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"Event Feed";
    UIBarButtonItem *addEvent = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEvent)];
    self.navigationItem.rightBarButtonItem = addEvent;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- UITableView Delegate


-(void)addEvent
{
    
}

@end
