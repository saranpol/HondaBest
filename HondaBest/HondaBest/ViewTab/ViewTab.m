//
//  ViewTab.m
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import "ViewTab.h"
#import "ViewMenu.h"
#import "ViewUtil.h"
#import "HBViewController.h"

@implementation ViewTab

@synthesize mViewMenu;
@synthesize mButtonBack;

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
	// Do any additional setup after loading the view.
    
    [self.tabBar setHidden:YES];

    if(IDIOM == IPAD)
        self.mViewMenu = [[ViewMenu alloc] initWithNibName:@"ViewMenu" bundle:nil];
    else
        self.mViewMenu = [[ViewMenu alloc] initWithNibName:@"ViewMenu_iphone" bundle:nil];
    mViewMenu.mViewTab = self;
    
    CGRect f = mViewMenu.view.frame;
    
    if(IDIOM == IPAD){
        f.size.height = 74 + 37;
        f.origin.y = 768 - f.size.height;
    }else{
        f.size.height = 36 + 18;
        f.origin.y = 320 - f.size.height;
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        f.size.width = screenRect.size.height;
        
    }
    [mViewMenu.view setFrame:f];
    [self.view addSubview:mViewMenu.view];
    
    UIImage *btnBackImage;
    if(IDIOM == IPAD){
        btnBackImage = [UIImage imageNamed:@"btn_back.png"];
        self.mButtonBack = [[UIButton alloc] initWithFrame:CGRectMake(25, 20, btnBackImage.size.width, btnBackImage.size.height)];
    }else{
        btnBackImage = [UIImage imageNamed:@"btn_back_iphone.png"];
        self.mButtonBack = [[UIButton alloc] initWithFrame:CGRectMake(12, 10, btnBackImage.size.width, btnBackImage.size.height)];
    }
    
    
    [mButtonBack setImage:btnBackImage forState:UIControlStateNormal];
    [mButtonBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mButtonBack];
    
    [mButtonBack setHidden:YES];
    
    [mViewMenu.view setAlpha:0];
    
}


- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    
    
    UIView *fromView = self.selectedViewController.view;
    UIViewController *toVC = [self.viewControllers objectAtIndex:selectedIndex];
    UIView *toView = [toVC view];
    if(fromView == toView)
        return;
    [toView setFrame:fromView.frame];
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) {
                        if (finished) {
                            [super setSelectedIndex:selectedIndex];
                            if(toVC.navigationController)
                                [toVC.navigationController setNavigationBarHidden:YES];

                        }
                    }];

    [mButtonBack setHidden:(selectedIndex==0)];
}

- (void)clickBack {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [mViewMenu hideAllMenu];
                     }completion:^(BOOL finished){
                         [mViewMenu hideAllButton0];
                     }];;
    [self setSelectedIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
