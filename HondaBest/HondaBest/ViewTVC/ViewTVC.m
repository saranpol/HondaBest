//
//  ViewTVC.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewTVC.h"
#import "HBViewController.h"


@implementation ViewTVC

@synthesize mPlayer;
@synthesize mViewFrame;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [mPlayer stop];
    [mPlayer.view removeFromSuperview];
    self.mPlayer = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#ifdef SKIP_INTRO
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self movieDone:nil];
    return;
}
#endif

- (void)setControlEnable {
    [mPlayer setControlStyle:MPMovieControlStyleFullscreen];
}

- (void)movieDone:(NSNotification*)notification {
    [self performSegueWithIdentifier:@"GotoViewIntro" sender:self];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    mPlayer.view.frame = mViewFrame.frame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"video_tvc" ofType:@"mp4"];
    self.mPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    mPlayer.view.frame = mViewFrame.frame;
    [mPlayer.view setBackgroundColor:[UIColor clearColor]];
    [mViewFrame addSubview:mPlayer.view];
    [mPlayer setControlStyle:MPMovieControlStyleNone];
    [mPlayer setRepeatMode:MPMovieRepeatModeNone];
    [mPlayer play];
    [self performSelector:@selector(setControlEnable) withObject:nil afterDelay:1.0];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieDone:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:mPlayer];

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
