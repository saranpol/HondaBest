//
//  ViewExterior.m
//  HondaBest
//
//  Created by saranpol on 12/30/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewExterior.h"
#import "HBViewController.h"
#import "ViewMenu.h"
#import "ViewPopupDetail.h"

@implementation ViewExterior

@synthesize mRotationPercent;
@synthesize mRotationPercentBegin;
@synthesize mImageRotate;
@synthesize mImageAngle0;
@synthesize mImageAngle1;


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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    HBViewController *vc = [HBViewController getVC];
    [vc.mViewMenu.mButtonInfo setBackgroundImage:[UIImage imageNamed:@"b_btn_information_black.png"] forState:UIControlStateNormal];
    if(IDIOM != IPAD){
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        CGRect nnn = vc.mViewMenu.mButtonInfo.frame;
        nnn.origin.x = screenRect.size.height - (nnn.size.width + 15);
        [vc.mViewMenu.mButtonInfo setFrame:nnn];
    }

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    HBViewController *vc = [HBViewController getVC];
    [UIView animateWithDuration:0.3 animations:^{
        [vc.mViewMenu.mButtonInfo setAlpha:1];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    HBViewController *vc = [HBViewController getVC];
    [vc.mViewMenu.mButtonInfo setAlpha:1];
    [UIView animateWithDuration:0.3 animations:^{
        [vc.mViewMenu.mButtonInfo setAlpha:0];
    }];
}


- (void)hideAngleImage {
    [UIView animateWithDuration:0.3 animations:^{
        [mImageAngle0 setAlpha:0];
        [mImageAngle1 setAlpha:0];
    }];
}

#define MAX_IMAGE_INDEX 35
- (IBAction)panView:(id)sender {
    if(mImageAngle0.alpha > 0){
        [self hideAngleImage];
    }
    
    UIPanGestureRecognizer *g = (UIPanGestureRecognizer*)sender;
    CGPoint t = [g translationInView:g.view];
    if(g.state == UIGestureRecognizerStateBegan){
        mRotationPercentBegin = mRotationPercent;
    }
    self.mRotationPercent = mRotationPercentBegin - t.x/(g.view.frame.size.width/2.5);
//      self.mRotationPercent = mRotationPercentBegin + t.x/g.view.frame.size.width;
    CGFloat p = mRotationPercent;
    if(mRotationPercent < 0){
        p = ceilf(-mRotationPercent) + mRotationPercent;
    }
    if(mRotationPercent > 1){
        p = mRotationPercent - floorf(mRotationPercent);
    }
    
    //NSLog(@"%f", p);
    NSInteger i = floorf(MAX_IMAGE_INDEX*p) + 1;
    NSString *iphone = @"_iphone";
    if(IDIOM == IPAD)
        iphone = @"";
    NSString *s = [NSString stringWithFormat:@"exterior_%02ld%@.jpg", (long)i, iphone];
    [mImageRotate setImage:[UIImage imageNamed:s]];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"GotoExteriorDetail"]) {
        ViewPopupDetail *v = [segue destinationViewController];
        v.mMode = MODE_EXTERIOR;
    }
}


@end
