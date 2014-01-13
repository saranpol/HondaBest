//
//  ViewBodyColor.m
//  HondaBest
//
//  Created by saranpol on 1/14/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewBodyColor.h"


@implementation ViewBodyColor

@synthesize mImageBG;
@synthesize mImageBodyColor;
@synthesize mImageCar;
@synthesize mImageText;
@synthesize mButtonCar1;
@synthesize mButtonCar2;
@synthesize mButtonCar3;
@synthesize mButtonCar4;
@synthesize mButtonCar5;
@synthesize mButtonCar6;
@synthesize mButtonCar7;
@synthesize mViewControl;


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
    
    [mButtonCar1 setSelected:YES];
    [mImageBodyColor setAlpha:0];
    [mImageCar setAlpha:0];
    [mImageText setAlpha:0];
    [mViewControl setAlpha:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [self slideBG];
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
                         if(finished){
                             [UIView animateWithDuration:0.3
                                                   delay:0
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  [mImageBodyColor setAlpha:1];
                                              }completion:nil];
                             
                             [UIView animateWithDuration:0.3
                                                   delay:0.5
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  [mImageCar setAlpha:1];
                                              }completion:nil];
                             
                             [UIView animateWithDuration:0.3
                                                   delay:1.0
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  [mImageText setAlpha:1];
                                              }completion:nil];
                             
                             [UIView animateWithDuration:0.3
                                                   delay:1.2
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  [mViewControl setAlpha:1];
                                              }completion:nil];
                         }
                         
                     }];
}

- (void)unselectAll {
    [mButtonCar1 setSelected:NO];
    [mButtonCar2 setSelected:NO];
    [mButtonCar3 setSelected:NO];
    [mButtonCar4 setSelected:NO];
    [mButtonCar5 setSelected:NO];
    [mButtonCar6 setSelected:NO];
    [mButtonCar7 setSelected:NO];
}

- (void)changeImageText:(int)car {
    [mImageCar setImage:[UIImage imageNamed:[NSString stringWithFormat:@"colorbody_car_%02d.png", car]]];
    [mImageText setImage:[UIImage imageNamed:[NSString stringWithFormat:@"colorbody_car_%02d_text.png", car]]];
}

- (IBAction)clickCar1:(id)sender {
    [self unselectAll];
    [mButtonCar1 setSelected:YES];
    [self changeImageText:1];
}

- (IBAction)clickCar2:(id)sender {
    [self unselectAll];
    [mButtonCar2 setSelected:YES];
    [self changeImageText:2];
}

- (IBAction)clickCar3:(id)sender {
    [self unselectAll];
    [mButtonCar3 setSelected:YES];
    [self changeImageText:3];
}

- (IBAction)clickCar4:(id)sender {
    [self unselectAll];
    [mButtonCar4 setSelected:YES];
    [self changeImageText:4];
}

- (IBAction)clickCar5:(id)sender {
    [self unselectAll];
    [mButtonCar5 setSelected:YES];
    [self changeImageText:5];
}

- (IBAction)clickCar6:(id)sender {
    [self unselectAll];
    [mButtonCar6 setSelected:YES];
    [self changeImageText:6];
}

- (IBAction)clickCar7:(id)sender {
    [self unselectAll];
    [mButtonCar7 setSelected:YES];
    [self changeImageText:7];
}




- (IBAction)clickBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
