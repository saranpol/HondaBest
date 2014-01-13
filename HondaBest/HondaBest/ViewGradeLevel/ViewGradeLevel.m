//
//  ViewGradeLevel.m
//  HondaBest
//
//  Created by saranpol on 1/14/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewGradeLevel.h"
#import "ViewGradeLevelDetail.h"

@implementation ViewGradeLevel

@synthesize mImageBG;
@synthesize mImageText;
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
    
    [mImageText setAlpha:0];
    [mViewControl setAlpha:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    if(mImageText.alpha == 0){
        [self slideBG];
    }else{
        CGRect r = mImageBG.frame;
        r.origin.x = 0;
        [mImageBG setFrame:r];
    }
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
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  [mImageText setAlpha:1];
                                              }completion:nil];
                             
                             [UIView animateWithDuration:0.3
                                                   delay:0.5
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  [mViewControl setAlpha:1];
                                              }completion:nil];
                         }
                         
                     }];
}



- (IBAction)clickBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"GradeLevel1"]) {
        ViewGradeLevelDetail *v = [segue destinationViewController];
        v.mPage = 0;
    }
    if ([[segue identifier] isEqualToString:@"GradeLevel2"]) {
        ViewGradeLevelDetail *v = [segue destinationViewController];
        v.mPage = 1;
    }
    if ([[segue identifier] isEqualToString:@"GradeLevel3"]) {
        ViewGradeLevelDetail *v = [segue destinationViewController];
        v.mPage = 2;
    }
    if ([[segue identifier] isEqualToString:@"GradeLevel4"]) {
        ViewGradeLevelDetail *v = [segue destinationViewController];
        v.mPage = 3;
    }    
}

@end
