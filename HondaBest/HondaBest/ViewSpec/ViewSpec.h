//
//  ViewSpec.h
//  HondaBest
//
//  Created by saranpol on 1/20/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewSpec : UIViewController

@property (nonatomic, weak) IBOutlet UIScrollView *mScrollView0;
@property (nonatomic, weak) IBOutlet UIScrollView *mScrollView1;
@property (nonatomic, weak) IBOutlet UIButton *mButton0;
@property (nonatomic, weak) IBOutlet UIButton *mButton1;
@property (nonatomic, weak) IBOutlet UIImageView *mImage1;


- (IBAction)clickButton0:(id)sender;
- (IBAction)clickButton1:(id)sender;
- (IBAction)clickBack:(id)sender;

@end
