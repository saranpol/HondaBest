//
//  ViewCamera.h
//  HondaBest
//
//  Created by saranpol on 2/4/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewCamera : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *mImage;
@property (nonatomic, strong) MPMoviePlayerController *mPlayer;
@property (nonatomic, weak) IBOutlet UIButton *mButton1;
@property (nonatomic, weak) IBOutlet UIButton *mButton2;
@property (nonatomic, weak) IBOutlet UIButton *mButton3;
@property (nonatomic, assign) float mDelay;

- (IBAction)click1:(id)sender;
- (IBAction)click2:(id)sender;
- (IBAction)click3:(id)sender;
@end
