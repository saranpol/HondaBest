//
//  ViewBodyColor.h
//  HondaBest
//
//  Created by saranpol on 1/14/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewBodyColor : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *mImageBG;
@property (nonatomic, weak) IBOutlet UIImageView *mImageBodyColor;
@property (nonatomic, weak) IBOutlet UIImageView *mImageCar;
@property (nonatomic, weak) IBOutlet UIImageView *mImageText;
@property (nonatomic, weak) IBOutlet UIButton *mButtonCar1;
@property (nonatomic, weak) IBOutlet UIButton *mButtonCar2;
@property (nonatomic, weak) IBOutlet UIButton *mButtonCar3;
@property (nonatomic, weak) IBOutlet UIButton *mButtonCar4;
@property (nonatomic, weak) IBOutlet UIButton *mButtonCar5;
@property (nonatomic, weak) IBOutlet UIButton *mButtonCar6;
@property (nonatomic, weak) IBOutlet UIButton *mButtonCar7;
@property (nonatomic, weak) IBOutlet UIView *mViewControl;

- (IBAction)clickCar1:(id)sender;
- (IBAction)clickCar2:(id)sender;
- (IBAction)clickCar3:(id)sender;
- (IBAction)clickCar4:(id)sender;
- (IBAction)clickCar5:(id)sender;
- (IBAction)clickCar6:(id)sender;
- (IBAction)clickCar7:(id)sender;
- (IBAction)clickBack:(id)sender;



@end
