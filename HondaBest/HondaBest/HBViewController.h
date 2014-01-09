//
//  HBViewController.h
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMenu;

@interface HBViewController : UIViewController

@property (nonatomic, weak) ViewMenu *mViewMenu;

+ (HBViewController*)getVC;

@end
