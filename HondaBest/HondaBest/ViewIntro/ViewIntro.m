//
//  ViewIntro.m
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewIntro.h"

@implementation ViewIntro

@synthesize mImageLogoCity;
@synthesize mImageLogoBest;


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
    [mImageLogoCity setAlpha:0];
    [mImageLogoBest setAlpha:0];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//#SKIP
//    [self gotoViewIntro];
//    return;
    
    
    [mImageLogoCity setAlpha:0];
    [mImageLogoBest setAlpha:0];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         [mImageLogoCity setAlpha:1];
                     }completion:^(BOOL finished){
                         [UIView animateWithDuration:0.3
                                               delay:1.0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              [mImageLogoCity setAlpha:0];
                                               }completion:^(BOOL finished){
                                                   [UIView animateWithDuration:0.3
                                                                         delay:0.0
                                                                       options:UIViewAnimationOptionCurveEaseInOut
                                                                    animations:^{
                                                                        [mImageLogoBest setAlpha:1];
                                                                    }completion:^(BOOL finished){
                                                                        [UIView animateWithDuration:0.3
                                                                                              delay:1.0
                                                                                            options:UIViewAnimationOptionCurveEaseInOut
                                                                                         animations:^{
                                                                                             [mImageLogoBest setAlpha:0];
                                                                                         }completion:^(BOOL finished){
                                                                                             [self gotoViewIntro];
                                                                                         }];
                                                                    }];
                                               }];
                     }];

}


- (void)gotoViewIntro {
    [self performSegueWithIdentifier:@"GotoLanding" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
