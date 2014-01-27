//
//  ViewTVC.h
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewTVC : UIViewController

@property (nonatomic, strong) MPMoviePlayerController *mPlayer;
@property (nonatomic, strong) IBOutlet UIView *mViewFrame;

- (IBAction)clickBack:(id)sender;

@end
