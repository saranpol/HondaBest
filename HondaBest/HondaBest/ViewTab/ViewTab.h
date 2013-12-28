//
//  ViewTab.h
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMenu;

@interface ViewTab : UITabBarController <UITabBarControllerDelegate>

@property (nonatomic, strong) ViewMenu *mViewMenu;

@end
