//
//  ViewTVC.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewTVC.h"



@implementation ViewTVC

@synthesize mPlayer;

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test_VideoTransparent" ofType:@"mp4"];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample_mpeg4" ofType:@"mp4"];
    self.mPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    mPlayer.view.frame = CGRectMake(184, 200, 400, 300);
    [mPlayer.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:mPlayer.view];
    [mPlayer setControlStyle:MPMovieControlStyleNone];
    [mPlayer setRepeatMode:MPMovieRepeatModeOne];
    [mPlayer play];
    
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
