//
//  ViewExterior.m
//  HondaBest
//
//  Created by saranpol on 12/30/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewExterior.h"

@implementation ViewExterior

@synthesize mRotationPercent;
@synthesize mRotationPercentBegin;
@synthesize mImageRotate;

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


#define MAX_IMAGE_INDEX 5
- (IBAction)panView:(id)sender {
    UIPanGestureRecognizer *g = (UIPanGestureRecognizer*)sender;
    CGPoint t = [g translationInView:g.view];
    if(g.state == UIGestureRecognizerStateBegan){
        mRotationPercentBegin = mRotationPercent;
    }
    self.mRotationPercent = mRotationPercentBegin + t.x/(g.view.frame.size.width/3.0);
//      self.mRotationPercent = mRotationPercentBegin + t.x/g.view.frame.size.width;
    CGFloat p = mRotationPercent;
    if(mRotationPercent < 0){
        p = ceilf(-mRotationPercent) + mRotationPercent;
    }
    if(mRotationPercent > 1){
        p = mRotationPercent - floorf(mRotationPercent);
    }
    
    //NSLog(@"%f", p);
    NSInteger i = floorf(MAX_IMAGE_INDEX*p);
    NSString *s = [NSString stringWithFormat:@"interior_%ld.jpg", (long)i];
    [mImageRotate setImage:[UIImage imageNamed:s]];
}

@end
