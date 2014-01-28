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
#import "HBViewController.h"

@implementation ViewMenu

@synthesize mMenuState;
@synthesize mIsFirstHideAll;
@synthesize mViewTab;
@synthesize mViewB;
@synthesize mViewE;
@synthesize mViewS;
@synthesize mViewT;
@synthesize mButtonB0;
@synthesize mButtonE0;
@synthesize mButtonS0;
@synthesize mButtonT0;
@synthesize mButtonInfo;

static int B_MENU_W;
static int B_MENU_WX;
static int BW;
static int EW;
static int SW;
static int TW;
static int BWX;
static int EWX;
static int SWX;
static int MENU_H;

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
    
    HBViewController *vc = [HBViewController getVC];
    vc.mViewMenu = self;
    
    if(IDIOM == IPAD){
        B_MENU_W = 112;
        B_MENU_WX = (B_MENU_W-10);
        BW = 400;
        EW = 612;
        SW = 629;
        TW = 602;
        BWX = (BW-10);
        EWX = (EW-10);
        SWX = (SW-10);
        MENU_H = 74;
    }else{
        B_MENU_W = 55;
        B_MENU_WX = (B_MENU_W-5);
        BW = 195;
        EW = 298;
        SW = 306;
        TW = 293;
        BWX = (BW-5);
        EWX = (EW-5);
        SWX = (SW-5);
        MENU_H = 36;
    }
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
            [self hideAllButton0];
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
    float x = (self.view.frame.size.width - (B_MENU_WX+B_MENU_WX+B_MENU_WX+B_MENU_W))/2.0;
    self.mMenuState = MENU_STATE_HIDE_ALL;
    [mViewB setFrame:CGRectMake(x, 0, B_MENU_W, MENU_H)];
    [mViewE setFrame:CGRectMake(x+B_MENU_WX, 0, B_MENU_W, MENU_H)];
    [mViewS setFrame:CGRectMake(x+B_MENU_WX+B_MENU_WX, 0, B_MENU_W, MENU_H)];
    [mViewT setFrame:CGRectMake(x+B_MENU_WX+B_MENU_WX+B_MENU_WX, 0, B_MENU_W, MENU_H)];
}

- (void)hideAllButton0 {
    [mButtonB0 setHidden:YES];
    [mButtonE0 setHidden:YES];
    [mButtonS0 setHidden:YES];
    [mButtonT0 setHidden:YES];
}

- (void)showMenuB {
    float x = (self.view.frame.size.width - (BWX+B_MENU_WX+B_MENU_WX+B_MENU_W))/2.0;
    self.mMenuState = MENU_STATE_SHOW_B;
    [mViewB setFrame:CGRectMake(x, 0, BW, MENU_H)];
    [mViewE setFrame:CGRectMake(x+BWX, 0, B_MENU_W, MENU_H)];
    [mViewS setFrame:CGRectMake(x+BWX+B_MENU_WX, 0, B_MENU_W, MENU_H)];
    [mViewT setFrame:CGRectMake(x+BWX+B_MENU_WX+B_MENU_WX, 0, B_MENU_W, MENU_H)];

    [mButtonB0 setHidden:NO];
}
- (void)showMenuE {
    float x = (self.view.frame.size.width - (B_MENU_WX+EWX+B_MENU_WX+B_MENU_W))/2.0;
    self.mMenuState = MENU_STATE_SHOW_E;
    [mViewB setFrame:CGRectMake(x, 0, B_MENU_W, MENU_H)];
    [mViewE setFrame:CGRectMake(x+B_MENU_WX, 0, EW, MENU_H)];
    [mViewS setFrame:CGRectMake(x+B_MENU_WX+EWX, 0, B_MENU_W, MENU_H)];
    [mViewT setFrame:CGRectMake(x+B_MENU_WX+EWX+B_MENU_WX, 0, B_MENU_W, MENU_H)];

    [mButtonE0 setHidden:NO];
}
- (void)showMenuS {
    float x = (self.view.frame.size.width - (B_MENU_WX+B_MENU_WX+SWX+B_MENU_W))/2.0;
    self.mMenuState = MENU_STATE_SHOW_S;
    [mViewB setFrame:CGRectMake(x, 0, B_MENU_W, MENU_H)];
    [mViewE setFrame:CGRectMake(x+B_MENU_WX, 0, B_MENU_W, MENU_H)];
    [mViewS setFrame:CGRectMake(x+B_MENU_WX+B_MENU_WX, 0, SW, MENU_H)];
    [mViewT setFrame:CGRectMake(x+B_MENU_WX+B_MENU_WX+SWX, 0, B_MENU_W, MENU_H)];

    [mButtonS0 setHidden:NO];
}
- (void)showMenuT {
    float x = (self.view.frame.size.width - (B_MENU_WX+B_MENU_WX+B_MENU_WX+TW))/2.0;
    self.mMenuState = MENU_STATE_SHOW_T;
    [mViewB setFrame:CGRectMake(x, 0, B_MENU_W, MENU_H)];
    [mViewE setFrame:CGRectMake(x+B_MENU_WX, 0, B_MENU_W, MENU_H)];
    [mViewS setFrame:CGRectMake(x+B_MENU_WX+B_MENU_WX, 0, B_MENU_W, MENU_H)];
    [mViewT setFrame:CGRectMake(x+B_MENU_WX+B_MENU_WX+B_MENU_WX, 0, TW, MENU_H)];

    [mButtonT0 setHidden:NO];
}


- (void)unselectAll:(UIView*)sv {
    for(id v in [sv subviews]){
        if([v isKindOfClass:[UIButton class]]){
            [v setSelected:NO];
        }
        [self unselectAll:v];
    }
}

- (void)selectButton:(UIButton*)b {
    [self unselectAll:self.view];
    [b setSelected:YES];
}

- (IBAction)clickB:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuB];
                     }completion:^(BOOL finished){
                         [mButtonB0 setHidden:NO];
                         [mButtonE0 setHidden:YES];
                         [mButtonS0 setHidden:YES];
                         [mButtonT0 setHidden:YES];
                     }];
    [mViewTab setSelectedIndex:1];
    [self selectButton:sender];
}
- (IBAction)clickExterior:(id)sender {
    [mViewTab setSelectedIndex:2];
    [self selectButton:sender];
}
- (IBAction)clickInterior:(id)sender {
    [mViewTab setSelectedIndex:3];
    [self selectButton:sender];
}



- (IBAction)clickE:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuE];
                     }completion:^(BOOL finished){
                         [mButtonB0 setHidden:YES];
                         [mButtonE0 setHidden:NO];
                         [mButtonS0 setHidden:YES];
                         [mButtonT0 setHidden:YES];
                     }];
    [mViewTab setSelectedIndex:4];
    [self selectButton:sender];
}
- (IBAction)clickE85:(id)sender {
    [mViewTab setSelectedIndex:5];
    [self selectButton:sender];
}
- (IBAction)clickiVTEC:(id)sender {
    [mViewTab setSelectedIndex:6];
    [self selectButton:sender];
}
- (IBAction)clickCTV:(id)sender {
    [mViewTab setSelectedIndex:7];
    [self selectButton:sender];
}
- (IBAction)clickECON:(id)sender {
    [mViewTab setSelectedIndex:8];
    [self selectButton:sender];
}
- (IBAction)clickPaddleShift:(id)sender {
    [mViewTab setSelectedIndex:9];
    [self selectButton:sender];
}
- (IBAction)clickEcoCoaching:(id)sender {
    [mViewTab setSelectedIndex:19];
    [self selectButton:sender];
}



- (IBAction)clickS:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuS];
                     }completion:^(BOOL finished){
                         [mButtonB0 setHidden:YES];
                         [mButtonE0 setHidden:YES];
                         [mButtonS0 setHidden:NO];
                         [mButtonT0 setHidden:YES];
                     }];;
    [mViewTab setSelectedIndex:10];
    [self selectButton:sender];
}
- (IBAction)clickSideRSR:(id)sender {
    [mViewTab setSelectedIndex:11];
    [self selectButton:sender];
}
- (IBAction)clickVSA:(id)sender {
    [mViewTab setSelectedIndex:13];
    [self selectButton:sender];
}
- (IBAction)clickESS:(id)sender {
    [mViewTab setSelectedIndex:14];
    [self selectButton:sender];
}
- (IBAction)clickBackCamera:(id)sender {
    [mViewTab setSelectedIndex:12];
    [self selectButton:sender];
}
- (IBAction)clickGCON:(id)sender {
    [mViewTab setSelectedIndex:20];
    [self selectButton:sender];
}
- (IBAction)clickISO:(id)sender {
    [mViewTab setSelectedIndex:21];
    [self selectButton:sender];
}





- (IBAction)clickT:(id)sender {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self showMenuT];
                     }completion:^(BOOL finished){
                         if(finished){
                             [mButtonB0 setHidden:YES];
                             [mButtonE0 setHidden:YES];
                             [mButtonS0 setHidden:YES];
                             [mButtonT0 setHidden:NO];
                         }
                     }];
    [mViewTab setSelectedIndex:15];
    [self selectButton:sender];
}
- (IBAction)clickTotalControl:(id)sender {
    [mViewTab setSelectedIndex:16];
    [self selectButton:sender];
}
- (IBAction)clickSmartKey:(id)sender {
    [mViewTab setSelectedIndex:17];
    [self selectButton:sender];
}
- (IBAction)clickLight:(id)sender {
    [mViewTab setSelectedIndex:18];
    [self selectButton:sender];
}
- (IBAction)clickOnePush:(id)sender {
    [mViewTab setSelectedIndex:22];
    [self selectButton:sender];
}
- (IBAction)clickAdvanceTouch:(id)sender {
    [mViewTab setSelectedIndex:23];
    [self selectButton:sender];
}


- (IBAction)clickInfo:(id)sender {
    if(mViewTab.selectedIndex == 2)
        [mViewTab.selectedViewController performSegueWithIdentifier:@"GotoExteriorDetail" sender:self];
    if(mViewTab.selectedIndex == 3)
        [mViewTab.selectedViewController performSegueWithIdentifier:@"GotoInteriorDetail" sender:self];
}






@end
