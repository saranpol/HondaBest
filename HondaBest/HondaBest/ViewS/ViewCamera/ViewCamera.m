//
//  ViewCamera.m
//  HondaBest
//
//  Created by saranpol on 2/4/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewCamera.h"
#import "HBViewController.h"

@implementation ViewCamera

@synthesize mImage;
@synthesize mPlayer;
@synthesize mButton1;
@synthesize mButton2;
@synthesize mButton3;
@synthesize mDelay;

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
    if(mPlayer)
        [mPlayer.view setAlpha:0.0];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.mDelay = 3.0;
    [self setVideo:1];
    self.mDelay = 1.0;
}


- (void)setupVideo:(NSString*)video {
    if(mPlayer && mPlayer.view.superview)
        [mPlayer.view removeFromSuperview];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:video ofType:@"mp4"];
    self.mPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    CGRect f = self.mImage.frame;
    f.origin.x = 0;
    f.origin.y = 0;
    self.mPlayer.view.frame = f;
    [mImage addSubview:mPlayer.view];
    [mPlayer setControlStyle:MPMovieControlStyleNone];
    [mPlayer setRepeatMode:MPMovieRepeatModeOne];
    [mPlayer play];
    [mPlayer.view setAlpha:0.0];
    [UIView animateWithDuration:0.3
                          delay:mDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [mPlayer.view setAlpha:1.0];
                     }completion:nil];

}


- (void)setVideo:(int)i {
    [mButton1 setSelected:NO];
    [mButton2 setSelected:NO];
    [mButton3 setSelected:NO];
    
    NSString *iphone = @"_iphone";
    if(IDIOM == IPAD)
        iphone = @"";

    switch (i) {
        case 1:
            [mButton1 setSelected:YES];
            [self setupVideo:[NSString stringWithFormat:@"S_06_rearcamera_view01%@", iphone]];
            break;
        case 2:
            [mButton2 setSelected:YES];
            [self setupVideo:[NSString stringWithFormat:@"S_06_rearcamera_view02%@", iphone]];
            break;
        case 3:
            [mButton3 setSelected:YES];
            [self setupVideo:[NSString stringWithFormat:@"S_06_rearcamera_view03%@", iphone]];
            break;

    }
}

- (IBAction)click1:(id)sender {
    [self setVideo:1];
}

- (IBAction)click2:(id)sender {
    [self setVideo:2];
}

- (IBAction)click3:(id)sender {
    [self setVideo:3];
}


@end
