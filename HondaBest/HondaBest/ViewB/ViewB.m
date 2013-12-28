//
//  ViewB.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewB.h"


@implementation ViewB

@synthesize mViewMeaning;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [mViewMeaning setAlpha:1.0];
    [UIView animateWithDuration:0.5
                          delay:2.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [mViewMeaning setAlpha:0.0];
                     }completion:^(BOOL finished){
                     }];
}

@end
