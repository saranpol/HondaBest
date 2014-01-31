//
//  ViewSpec.m
//  HondaBest
//
//  Created by saranpol on 1/20/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewSpec.h"
#import "HBViewController.h"

@implementation ViewSpec

@synthesize mScrollView0;
@synthesize mScrollView1;
@synthesize mButton0;
@synthesize mButton1;
@synthesize mImage1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self clickButton0:nil];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGSize s0 = mScrollView0.frame.size;
    if(IDIOM == IPAD)
        s0.height = 2367;
    else
        s0.height = 1300;
    [mScrollView0 setContentSize:s0];
    CGSize s1 = mScrollView1.frame.size;
    if(IDIOM == IPAD)
        s1.height = 1500;
    else
        s1.height = 850;
    [mScrollView1 setContentSize:s1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickButton0:(id)sender {
    [mButton0 setSelected:YES];
    [mButton1 setSelected:NO];
    [mScrollView0 setHidden:YES];
    [mScrollView1 setHidden:NO];
    //[mImage1 setHidden:NO];
}

- (IBAction)clickButton1:(id)sender {
    [mButton0 setSelected:NO];
    [mButton1 setSelected:YES];
    [mScrollView0 setHidden:NO];
    [mScrollView1 setHidden:YES];
    //[mImage1 setHidden:YES];

}

- (IBAction)clickBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
