//
//  ViewLanding.h
//  HondaBest
//
//  Created by saranpol on 12/29/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewLanding : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *mImageBG;
@property (nonatomic, weak) IBOutlet UIImageView *mImageLogo;
@property (nonatomic, weak) IBOutlet UIView *mViewTopMenu;

- (IBAction)clickBack:(id)sender;

@end
