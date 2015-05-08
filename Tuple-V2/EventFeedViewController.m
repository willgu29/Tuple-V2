//
//  EventFeedViewController.m
//  Tuple-V2
//
//  Created by William Gu on 5/7/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EventFeedViewController.h"
#import "CreateEventViewController.h"
#import "SwipeView.h"

@interface EventFeedViewController ()

@property (nonatomic, weak) IBOutlet UILabel *outOfCards;

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
-(void)viewDidAppear:(BOOL)animated
{
    [self createSwipeableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else if (direction == MDCSwipeDirectionRight ) {
        return YES;
    } else {
    
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        return NO;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else if (direction == MDCSwipeDirectionRight) {
        NSLog(@"Photo saved!");
    } else {
        
    }
}

#pragma mark - Helpers

-(void)createSwipeableView
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SwipeView" owner:self options:nil];
    SwipeView *swipeView  = [nib objectAtIndex:0];
    
    
    
    MDCSwipeOptions *options = [MDCSwipeOptions new];
    options.delegate = self;
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            //            NSLog(@"Let go now to delete the photo!");
        }
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionRight) {
            //            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    [swipeView setFrame:CGRectMake(18, 90, swipeView.frame.size.width, swipeView.frame.size.height)];
    [swipeView mdc_swipeToChooseSetup:options];
    [self.view insertSubview:swipeView aboveSubview:_outOfCards];

}



#pragma mark- Hooks

-(void)addEvent
{
    
}


@end
