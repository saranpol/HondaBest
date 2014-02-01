//
//  ViewInterior.m
//  HondaBest
//
//  Created by saranpol on 12/30/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewInterior.h"
#import "HBViewController.h"
#import "ViewMenu.h"
#import "ViewPopupDetail.h"


@implementation ViewInterior

@synthesize mPopover;
@synthesize mMotionManager;

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

//    JAPanoView *panoView = [[JAPanoView alloc] initWithFrame:self.view.frame];
//    self.view = panoView;
//    JAPanoView *panoView = [[JAPanoView alloc] initWithFrame:CGRectMake(100, 100, 400, 300)];
    JAPanoView *panoView = [[JAPanoView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [panoView setClipsToBounds:YES];
    //[self.view addSubview:panoView];
    self.view = panoView;
    panoView.delegate = self;
    if(IDIOM == IPAD){
        [panoView setFrontImage:[UIImage imageNamed:@"interior_0.jpg"]
                     rightImage:[UIImage imageNamed:@"interior_1.jpg"]
                      backImage:[UIImage imageNamed:@"interior_2.jpg"]
                      leftImage:[UIImage imageNamed:@"interior_3.jpg"]
                       topImage:[UIImage imageNamed:@"interior_4.jpg"]
                    bottomImage:[UIImage imageNamed:@"interior_5.jpg"]];
    }else{
        [panoView setFrontImage:[UIImage imageNamed:@"interior_0_iphone.jpg"]
                     rightImage:[UIImage imageNamed:@"interior_1_iphone.jpg"]
                      backImage:[UIImage imageNamed:@"interior_2_iphone.jpg"]
                      leftImage:[UIImage imageNamed:@"interior_3_iphone.jpg"]
                       topImage:[UIImage imageNamed:@"interior_4_iphone.jpg"]
                    bottomImage:[UIImage imageNamed:@"interior_5_iphone.jpg"]];
    }
    
//    UILabel *hotspot1=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
//    hotspot1.backgroundColor=[UIColor clearColor];
//    hotspot1.textColor=[UIColor redColor];
//    hotspot1.text=@"DOOR";
//    hotspot1.textAlignment=UITextAlignmentCenter;
//    [panoView addHotspot:hotspot1 atHAngle:0 vAngle:0];
//    UIView *hotspot2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    hotspot2.backgroundColor=[UIColor yellowColor];
//    hotspot2.alpha=0.5;
//    hotspot2.layer.cornerRadius=25;
//    [panoView addHotspot:hotspot2 atHAngle:M_PI_4 vAngle:M_PI_4];
//
    /*
    UIButton *hotspot3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [hotspot3 setTitle:@"clouds" forState:UIControlStateNormal];
    [hotspot3 setFrame:CGRectMake(0, 0, 100, 30)];
    hotspot3.shouldApplyPerspective=NO;
    [hotspot3 addTarget:self action:@selector(centerClouds:) forControlEvents:UIControlEventTouchUpInside];
    [panoView addHotspot:hotspot3 atHAngle:-M_PI_2 vAngle:M_PI_4];
     */
//
//    
//    UITapGestureRecognizer *tapgr=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
//    [hotspot2 addGestureRecognizer:tapgr];


}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    HBViewController *vc = [HBViewController getVC];
    [vc.mViewMenu.mButtonInfo setBackgroundImage:[UIImage imageNamed:@"b_btn_information.png"] forState:UIControlStateNormal];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    HBViewController *vc = [HBViewController getVC];
    [vc.mViewMenu.mButtonInfo setAlpha:0];
    [UIView animateWithDuration:0.3 animations:^{
        [vc.mViewMenu.mButtonInfo setAlpha:1];
    }];
    [self startUpdates];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    HBViewController *vc = [HBViewController getVC];
    [vc.mViewMenu.mButtonInfo setAlpha:1];
    [UIView animateWithDuration:0.3 animations:^{
        [vc.mViewMenu.mButtonInfo setAlpha:0];
    }];
    [self stopUpdates];
}




-(void)centerClouds:(id)sender{
//    [(JAPanoView*)self.view setHAngle:-M_PI_2];
//    [(JAPanoView*)self.view setVAngle:M_PI_4];
    self.mPopover = [[UIPopoverController alloc] initWithContentViewController:[[UIViewController alloc] init]];
    [mPopover presentPopoverFromRect:((UIButton*)sender).frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"GotoInteriorDetail"]) {
        ViewPopupDetail *v = [segue destinationViewController];
        v.mMode = MODE_INTERIOR;
    }
}




- (void)startUpdates {
    self.mMotionManager = [[CMMotionManager alloc] init];
    ViewInterior * __weak weakSelf = self;
    
    if ([mMotionManager isGyroAvailable] == YES) {
        [mMotionManager setGyroUpdateInterval:0.01];
        [mMotionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            if(weakSelf){
                double y = gyroData.rotationRate.y;
                double x = gyroData.rotationRate.x;
                if([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft){
                    x = -x;
                    y = -y;
                }
                JAPanoView *v = (JAPanoView*)weakSelf.view;
                if(fabs(y) > 0.1){
                    [v setVAngle:v.vAngle+y/120.0];
                }
                if(fabs(x) > 0.1){
                    [v setHAngle:v.hAngle+x/120.0];
                }

            }
            
        }];
    }
}

- (void)stopUpdates {
    if ([mMotionManager isGyroActive] == YES) {
        [mMotionManager stopGyroUpdates];
    }
}






@end
