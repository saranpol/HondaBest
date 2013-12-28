//
//  ViewMenu.h
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewTab;

@interface ViewMenu : UIViewController

enum {
    MENU_STATE_HIDE_ALL = 0,
    MENU_STATE_SHOW_B,
    MENU_STATE_SHOW_E,
    MENU_STATE_SHOW_S,
    MENU_STATE_SHOW_T
};

@property (nonatomic, assign) NSInteger mMenuState;
@property (nonatomic, assign) BOOL mIsFirstHideAll;
@property (nonatomic, weak) ViewTab *mViewTab;
@property (nonatomic, weak) IBOutlet UIView *mViewB;
@property (nonatomic, weak) IBOutlet UIView *mViewE;
@property (nonatomic, weak) IBOutlet UIView *mViewS;
@property (nonatomic, weak) IBOutlet UIView *mViewT;

- (IBAction)clickB:(id)sender;
- (IBAction)clickInterior:(id)sender;
- (IBAction)clickExterior:(id)sender;

- (IBAction)clickE:(id)sender;
- (IBAction)clickS:(id)sender;
- (IBAction)clickT:(id)sender;


@end
