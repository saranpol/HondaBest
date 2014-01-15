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
@property (nonatomic, weak) IBOutlet UIButton *mButtonB0;
@property (nonatomic, weak) IBOutlet UIButton *mButtonE0;
@property (nonatomic, weak) IBOutlet UIButton *mButtonS0;
@property (nonatomic, weak) IBOutlet UIButton *mButtonT0;
@property (nonatomic, weak) IBOutlet UIButton *mButtonInfo;


- (void)hideAllMenu;
- (void)hideAllButton0;

- (IBAction)clickB:(id)sender;
- (IBAction)clickInterior:(id)sender;
- (IBAction)clickExterior:(id)sender;

- (IBAction)clickE:(id)sender;
- (IBAction)clickE85:(id)sender;
- (IBAction)clickiVTEC:(id)sender;
- (IBAction)clickCTV:(id)sender;
- (IBAction)clickECON:(id)sender;
- (IBAction)clickPaddleShift:(id)sender;
- (IBAction)clickEcoCoaching:(id)sender;


- (IBAction)clickS:(id)sender;
- (IBAction)clickSideRSR:(id)sender;
- (IBAction)clickVSA:(id)sender;
- (IBAction)clickESS:(id)sender;
- (IBAction)clickBackCamera:(id)sender;
- (IBAction)clickGCON:(id)sender;
- (IBAction)clickISO:(id)sender;


- (IBAction)clickT:(id)sender;
- (IBAction)clickTotalControl:(id)sender;
- (IBAction)clickSmartKey:(id)sender;
- (IBAction)clickLight:(id)sender;
- (IBAction)clickOnePush:(id)sender;
- (IBAction)clickAdvanceTouch:(id)sender;

- (IBAction)clickInfo:(id)sender;

@end
