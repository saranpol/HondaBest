//
//  ViewPaddle.h
//  HondaBest
//
//  Created by saranpol on 1/18/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPaddle : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *mButtonGuide;
@property (nonatomic, weak) IBOutlet UIButton *mButtonLeft;
@property (nonatomic, weak) IBOutlet UIButton *mButtonRight;
@property (nonatomic, weak) IBOutlet UIImageView *mImageSpeed;
@property (nonatomic, assign) NSInteger mCountGear;


- (IBAction)clickButtonGuide:(id)sender;
- (IBAction)clickButtonLeft:(id)sender;
- (IBAction)clickButtonRight:(id)sender;

@end
