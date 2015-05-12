//
//  CreateEventViewController.m
//  Tuple-V2
//
//  Created by William Gu on 5/7/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//
#import "ParseDatabase.h"
#import "CreateEventViewController.h"

@interface CreateEventViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@property (nonatomic, strong) NSArray *sendTo;
@property (nonatomic) NSInteger selectedGroup;

@end

@implementation CreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _sendTo = [[ParseDatabase shared] getCurrentUserGroups];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"Create Event";
    UIBarButtonItem *addTuple = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTuple)];
    self.navigationController.navigationItem.rightBarButtonItem = addTuple;
    self.automaticallyAdjustsScrollViewInsets = NO;
}


#pragma mark - UITextViewDelegate


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textView resignFirstResponder];
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Write something different..."]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Write something different...";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

#pragma mark - UIPickerDelegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _selectedGroup = row;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_sendTo objectAtIndex:row];
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_sendTo count];
}


#pragma mark - Hooks

-(void)addTuple
{
    //TODO: Save Data
}



@end
