//
//  HBViewController.h
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

//#define SKIP_INTRO
#define IDIOM UI_USER_INTERFACE_IDIOM()
#define IPAD UIUserInterfaceIdiomPad

@class ViewMenu;
@class SoundEffect;

@interface HBViewController : UIViewController

@property (nonatomic, weak) ViewMenu *mViewMenu;
@property (nonatomic, strong) SoundEffect *mSoundStart;
@property (nonatomic, strong) AVAudioPlayer *mSoundIntro;

+ (HBViewController*)getVC;

- (IBAction)clickStart:(id)sender;
- (void)playSoundIntro;

@end
