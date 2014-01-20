//
//  CellFeature.m
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "CellFeature.h"

@implementation CellFeature

@synthesize mPlayer;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setupVideo:(NSString*)video {
    if(mPlayer && mPlayer.view.superview)
        [mPlayer.view removeFromSuperview];
    NSString *path = [[NSBundle mainBundle] pathForResource:video ofType:@"mp4"];
    self.mPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    self.mPlayer.view.frame = self.mImageFeature.frame;
    [self addSubview:mPlayer.view];
    [mPlayer setControlStyle:MPMovieControlStyleNone];
    [mPlayer setRepeatMode:MPMovieRepeatModeOne];
    [mPlayer play];
    [mPlayer.view setAlpha:0.0];
    [UIView animateWithDuration:0.3
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [mPlayer.view setAlpha:1.0];
                     }completion:nil];
}


@end
