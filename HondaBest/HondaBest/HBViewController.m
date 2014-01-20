//
//  HBViewController.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "HBViewController.h"
#import "SoundEffect.h"

@implementation HBViewController

static HBViewController *instance;

@synthesize mSoundStart;
@synthesize mSoundIntro;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    instance = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (HBViewController*)getVC {
    return instance;
}

- (IBAction)clickStart:(id)sender {
//    self.mSoundStart = [[SoundEffect alloc] initWithSoundNamed:@"sound_start_engine.mp3"];
//    [mSoundStart play];
}

- (AVAudioPlayer*)loadAVAudioPlayer:(NSString*)name {
    NSError *error;
    NSURL *soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:name ofType:@"mp3"]];
    return [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
}

- (void)playSoundIntro {
//    self.mSoundIntro = [self loadAVAudioPlayer:@"intro"];
//    mSoundIntro.numberOfLoops = -1;
//    mSoundIntro.volume = 0.2;
//    [mSoundIntro prepareToPlay];
//    [mSoundIntro play];
}

@end
