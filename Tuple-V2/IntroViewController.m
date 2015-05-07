//
//  IntroViewController.m
//  Tuple-V2
//
//  Created by William Gu on 5/7/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "IntroViewController.h"
#import "EventFeedViewController.h"


@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Hooks

-(IBAction)submit:(UIButton *)sender
{
    EventFeedViewController *eventVC = [[EventFeedViewController alloc] initWithNibName:@"EventFeedViewController" bundle:nil];
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[eventVC];

    
    [self.navigationController pushViewController:eventVC animated:YES];
}

@end
