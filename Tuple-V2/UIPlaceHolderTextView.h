//
//  UIPlaceHolderTextView.h
//  TheFactoryCode
//
//  Created by William Gu on 5/11/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;


@end
