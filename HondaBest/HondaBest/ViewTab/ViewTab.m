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

    self.mViewMenu = [[ViewMenu alloc] initWithNibName:@"ViewMenu" bundle:nil];
    mViewMenu.mViewTab = self;
    
    CGRect f = mViewMenu.view.frame;
    f.origin.y = 768 - f.size.height;
//    f.origin.y = 320 - f.size.height;
    [mViewMenu.view setFrame:f];
    [self.view addSubview:mViewMenu.view];
    
    self.mButtonBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 100, 50)];
    [mButtonBack setTitle:@"BACK" forState:UIControlStateNormal];
    [mButtonBack setBackgroundColor:[UIColor redColor]];
    [mButtonBack setTitle:@"BACKKK" forState:UIControlStateHighlighted];
    [mButtonBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mButtonBack];
    
    [mButtonBack setHidden:YES];
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
