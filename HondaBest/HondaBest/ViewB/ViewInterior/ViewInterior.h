//
//  ViewInterior.h
//  HondaBest
//
//  Created by saranpol on 12/30/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAPanoView.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewInterior : UIViewController <JAPanoViewDelegate>

@property (nonatomic, strong) UIPopoverController *mPopover;
@property (nonatomic, strong) CMMotionManager *mMotionManager;

@end
