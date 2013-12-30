//
//  ViewMenu.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewMenu.h"
#import "ViewTab.h"
#import "ViewUtil.h"

@implementation ViewMenu

@synthesize mMenuState;
@synthesize mIsFirstHideAll;
@synthesize mViewTab;
@synthesize mViewB;
@synthesize mViewE;
@synthesize mViewS;
@synthesize mViewT;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupViewState];
}

- (void)setupViewState {
    switch (mMenuState) {
        case MENU_STATE_HIDE_ALL:
            [self hideAllMenu];
            break;
        case MENU_STATE_SHOW_B:
            [self showMenuB];
            break;
        case MENU_STATE_SHOW_E:
            [self showMenuE];
            break;
        case MENU_STATE_SHOW_S:
            [self showMenuS];
            break;
        case MENU_STATE_SHOW_T:
            [self showMenuT];
            break;
    }
}

- (void)hideAllMenu {
    self.mMenuState = MENU_STATE_HIDE_ALL;
    [mViewB setFrame:CGRectMake(300, 10, 30, 33)];
    [mViewE setFrame:CGRectMake(300+30, 10, 30, 33)];
    [mViewS setFrame:CGRectMake(300+30+30, 10, 30, 33)];
    [mViewT setFrame:CGRectMake(300+30+30+30, 10, 30, 33)];
}

- (void)showMenuB {
    self.mMenuState = MENU_STATE_SHOW_B;
    [mViewB setFrame:CGRectMake(70, 10, 216, 33)];
    [mViewE setFrame:CGRectMake(70+216, 10, 30, 33)];
    [mViewS setFrame:CGRectMake(70+216+30, 10, 30, 33)];
    [mViewT setFrame:CGRectMake(70+216+30+30, 10, 30, 33)];
}
- (void)showMenuE {
    self.mMenuState = MENU_STATE_SHOW_E;
    [mViewB setFrame:CGRectMake(70, 10, 30, 33)];
    [mViewE setFrame:CGRectMake(70+30, 10, 487, 33)];
    [mViewS setFrame:CGRectMake(70+30+487, 10, 30, 33)];
    [mViewT setFrame:CGRectMake(70+30+487+30, 10, 30, 33)];
}
- (void)showMenuS {
    self.mMenuState = MENU_STATE_SHOW_S;
    [mViewB setFrame:CGRectMake(70, 10, 30, 33)];
    [mViewE setFrame:CGRectMake(70+30, 10, 30, 33)];
    [mViewS setFrame:CGRectMake(70+30+30, 10, 400, 33)];
    [mViewT setFrame:CGRectMake(70+30+30+400, 10, 30, 33)];
}
- (void)showMenuT {
    self.mMenuState = MENU_STATE_SHOW_T;
    [mViewB setFrame:CGRectMake(70, 10, 30, 33)];
    [mViewE setFrame:CGRectMake(70+30, 10, 30, 33)];
    [mViewS setFrame:CGRectMake(70+30+30, 10, 30, 33)];
    [mViewT setFrame:CGRectMake(70+30+30+30, 10, 309, 33)];
}



- (IBAction)clickB:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuB];
                     }completion:nil];
    [mViewTab setSelectedIndex:1];
}
- (IBAction)clickExterior:(id)sender {
    [mViewTab setSelectedIndex:2];
}
- (IBAction)clickInterior:(id)sender {
    [mViewTab setSelectedIndex:3];
}



- (IBAction)clickE:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuE];
                     }completion:nil];
    [mViewTab setSelectedIndex:4];
}
- (IBAction)clickE85:(id)sender {
    [mViewTab setSelectedIndex:5];
}
- (IBAction)clickiVTEC:(id)sender {
    [mViewTab setSelectedIndex:6];
}
- (IBAction)clickCTV:(id)sender {
    [mViewTab setSelectedIndex:7];
}
- (IBAction)clickECON:(id)sender {
    [mViewTab setSelectedIndex:8];
}
- (IBAction)clickPaddleShift:(id)sender {
    [mViewTab setSelectedIndex:9];
}




- (IBAction)clickS:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuS];
                     }completion:nil];
    [mViewTab setSelectedIndex:10];
}
- (IBAction)clickSideRSR:(id)sender {
    [mViewTab setSelectedIndex:11];
}
- (IBAction)clickSideCertain:(id)sender {
    [mViewTab setSelectedIndex:12];
}
- (IBAction)clickVSA:(id)sender {
    [mViewTab setSelectedIndex:13];
}
- (IBAction)clickESS:(id)sender {
    [mViewTab setSelectedIndex:14];
}





- (IBAction)clickT:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuT];
                     }completion:nil];
    [mViewTab setSelectedIndex:15];
}
- (IBAction)clickTouchSC:(id)sender {
    [mViewTab setSelectedIndex:16];
}
- (IBAction)clickMirrorLink:(id)sender {
    [mViewTab setSelectedIndex:17];
}
- (IBAction)clickCruise:(id)sender {
    [mViewTab setSelectedIndex:18];
}











@end
