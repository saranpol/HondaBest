//
//  ViewLanding.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewLanding.h"
#import "HBViewController.h"
#import "ViewMenu.h"

@implementation ViewLanding

@synthesize mImageBG;
@synthesize mImageLogo;
@synthesize mViewTopMenu;

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
    [mViewTopMenu setAlpha:0];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [mImageLogo setAlpha:0];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
#ifdef SKIP_INTRO
    HBViewController *vc = [HBViewController getVC];
    [vc.mViewMenu.view setAlpha:1.0];
    [UIView animateWithDuration:0.3 animations:^{
        [mViewTopMenu setAlpha:1.0];
    }];
    return
#endif
    
    [UIView animateWithDuration:2.0
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect r = mImageBG.frame;
                         if(self.view.frame.size.width == 480){
                             r.origin.x = -(r.size.width - self.view.frame.size.width) + 44;
                         }else{
                             r.origin.x = -(r.size.width - self.view.frame.size.width);
                         }
                         [mImageBG setFrame:r];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              [mImageLogo setAlpha:1];
                                          }
                                          completion:^(BOOL finished){
                                              HBViewController *vc = [HBViewController getVC];
                                              if(vc.mViewMenu.view.alpha == 0){
                                                  [UIView animateWithDuration:0.3 animations:^{
                                                      [vc.mViewMenu.view setAlpha:1.0];
                                                  }];
                                                  [UIView animateWithDuration:0.3 animations:^{
                                                      [mViewTopMenu setAlpha:1.0];
                                                  }];
                                              }
                                          }];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
