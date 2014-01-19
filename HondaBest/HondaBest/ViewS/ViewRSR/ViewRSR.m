//
//  ViewRSR.m
//  HondaBest
//
//  Created by saranpol on 1/13/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewRSR.h"

@implementation ViewRSR

@synthesize mImageRSR;
@synthesize mButtonGuide;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#define RSR_GUIDE_SHOWN @"RSR_GUIDE_SHOWN"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([userDefaults objectForKey:RSR_GUIDE_SHOWN])
        [mButtonGuide setHidden:YES];
    else
        [mButtonGuide setHidden:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self becomeFirstResponder];
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
    [mImageRSR setImage:[UIImage imageNamed:@"s_01_sidesrs.png"]];
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        // Put in code here to handle shake
        if(![mButtonGuide isHidden]){
            [self clickButtonGuide:nil];
        }
        [mImageRSR setImage:[UIImage imageNamed:@"s_01_sidesrs_active.png"]];
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (IBAction)clickButtonGuide:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [mButtonGuide setAlpha:0];
    }completion:^(BOOL finished){
        [mButtonGuide setHidden:YES];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:[NSNumber numberWithInt:1] forKey:RSR_GUIDE_SHOWN];
        [userDefaults synchronize];
    }];
}


@end
