//
//  ViewS.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewS.h"


@implementation ViewS

@synthesize mViewMeaning;
@synthesize mImageBG;
@synthesize mImageLogo;
@synthesize mImageHead;
@synthesize mImageText;


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
    [mImageLogo setAlpha:0];
    [mImageHead setAlpha:0];
    [mImageText setAlpha:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [mViewMeaning setAlpha:1.0];
    [mImageLogo setAlpha:0];
    [mImageHead setAlpha:0];
    [mImageText setAlpha:0];

    [UIView animateWithDuration:0.5
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [mViewMeaning setAlpha:0.0];
                     }completion:^(BOOL finished){
                         [self slideBG];
                     }];
}

- (void)slideBG {
    [UIView animateWithDuration:2.0
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect r = mImageBG.frame;
                         r.origin.x = 0;
                         [mImageBG setFrame:r];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.3
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              [mImageLogo setAlpha:1];
                                          }completion:nil];
                         
                         [UIView animateWithDuration:0.3
                                               delay:0.5
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              [mImageHead setAlpha:1];
                                          }completion:nil];
                         
                         [UIView animateWithDuration:0.3
                                               delay:1.0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              [mImageText setAlpha:1];
                                          }completion:nil];
                         
                     }];
}

@end
