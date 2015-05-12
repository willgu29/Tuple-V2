//
//  EventFeedViewController.h
//  Tuple-V2
//
//  Created by William Gu on 5/7/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "ParseDatabase.h"

@interface EventFeedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MDCSwipeToChooseDelegate, ParseDelegate>

@end
