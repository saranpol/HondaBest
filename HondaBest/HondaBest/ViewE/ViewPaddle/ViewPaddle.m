//
//  ViewPaddle.m
//  HondaBest
//
//  Created by saranpol on 1/18/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewPaddle.h"

@implementation ViewPaddle

@synthesize mButtonGuide;
@synthesize mButtonLeft;
@synthesize mButtonRight;
@synthesize mImageSpeed;
@synthesize mCountGear;

#define PADDLE_GUIDE_SHOWN @"PADDLE_GUIDE_SHOWN"

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
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([userDefaults objectForKey:PADDLE_GUIDE_SHOWN])
        [mButtonGuide setHidden:YES];
    else
        [mButtonGuide setHidden:NO];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    mButtonLeft.transform = CGAffineTransformMakeScale(0.5,0.5);
    mButtonRight.transform = CGAffineTransformMakeScale(0.5,0.5);

    [UIView animateWithDuration:1.0
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         mButtonLeft.transform = CGAffineTransformMakeScale(1,1);
                         mButtonRight.transform = CGAffineTransformMakeScale(1,1);
                     }completion:^(BOOL finished){
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickButtonGuide:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [mButtonGuide setAlpha:0];
    }completion:^(BOOL finished){
        [mButtonGuide setHidden:YES];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:[NSNumber numberWithInt:1] forKey:PADDLE_GUIDE_SHOWN];
        [userDefaults synchronize];
    }];
}

- (void)updateGear {
    switch (mCountGear) {
        case 0:
        case 1:
            [mImageSpeed setImage:[UIImage imageNamed:@"e_PaddleShift_paddleshift_speed1.png"]];
            break;
        case 2:
        case 3:
            [mImageSpeed setImage:[UIImage imageNamed:@"e_PaddleShift_paddleshift_speed2.png"]];
            break;
        case 4:
        case 5:
            [mImageSpeed setImage:[UIImage imageNamed:@"e_PaddleShift_paddleshift_speed3.png"]];
            break;
        case 6:
            [mImageSpeed setImage:[UIImage imageNamed:@"e_PaddleShift_paddleshift_speed4.png"]];
            break;
    }
}

- (IBAction)clickButtonLeft:(id)sender {
    mCountGear--;
    if(mCountGear<0)
        mCountGear = 0;
    [self updateGear];
}

- (IBAction)clickButtonRight:(id)sender {
    mCountGear++;
    if(mCountGear>6)
        mCountGear = 6;
    [self updateGear];
}


@end
