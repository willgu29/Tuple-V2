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
@property (nonatomic, strong) NSMutableArray *cardData;

@end

@implementation EventFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _cardData = [[NSMutableArray alloc] init];
    [[ParseDatabase shared] setDelegate:self];
    [[ParseDatabase shared] getContent];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    self.title = @"Event Feed";


}
-(void)viewDidAppear:(BOOL)animated
{
    
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
        [_cardData removeObjectAtIndex:0];
    } else if (direction == MDCSwipeDirectionRight) {
        NSLog(@"Photo saved!");
        [_cardData removeObjectAtIndex:0];
    } else {
        
    }
}

#pragma mark - Parse Delegate
-(void)contentFetched:(NSArray *)content
{
    for (int i = 0; i < [content count]; i++)
    {
        [self createSwipeableView:[content objectAtIndex:i]];
    }
}

#pragma mark - Helpers

-(void)createSwipeableView:(PFObject *)contentData
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SwipeView" owner:self options:nil];
    SwipeView *swipeView  = [nib objectAtIndex:0];
    swipeView.contentText.text = contentData[@"contentText"];
    swipeView.author.text = contentData[@"username"];
    swipeView.group.text = contentData[@"group"];
    
    MDCSwipeOptions *options = [MDCSwipeOptions new];
    options.delegate = self;
    
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.0f && state.direction == MDCSwipeDirectionLeft) {
                        NSLog(@"Let go now to delete the photo!");
        }
        else if (state.thresholdRatio == 1.0f && state.direction == MDCSwipeDirectionRight) {
                       NSLog(@"Let go now to delete the photo!");
        }
        else if (state.direction == MDCSwipeDirectionNone){
            NSLog(@"DO NOTHING");
        }
        
    };
    
    [swipeView setFrame:CGRectMake(18, 90, swipeView.frame.size.width, swipeView.frame.size.height)];
    [swipeView mdc_swipeToChooseSetup:options];
    
    [_cardData addObject:swipeView];
    
    [self.view insertSubview:swipeView aboveSubview:_outOfCards];

}

-(IBAction)optIn:(UIButton *)sender
{
    
    SwipeView *swipeView = [_cardData objectAtIndex:0];
    [swipeView mdc_swipe:MDCSwipeDirectionRight];

}
-(IBAction)meh:(UIButton *)sender
{
    SwipeView *swipeView = [_cardData objectAtIndex:0];
    [swipeView mdc_swipe:MDCSwipeDirectionLeft];
}

#pragma mark- Hooks

-(IBAction)addEvent:(UIButton *)sender
{
    CreateEventViewController *createVC = [[CreateEventViewController alloc] initWithNibName:@"CreateEventViewController" bundle:nil];
    [self.navigationController pushViewController:createVC animated:YES];
}


@end
