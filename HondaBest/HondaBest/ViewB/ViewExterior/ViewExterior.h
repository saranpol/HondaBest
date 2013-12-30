//
//  ViewExterior.h
//  HondaBest
//
//  Created by saranpol on 12/30/2556 BE.
//  Copyright (c) 2556 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewExterior : UIViewController

@property (nonatomic, assign) CGFloat mRotationPercent;
@property (nonatomic, assign) CGFloat mRotationPercentBegin;
@property (nonatomic, weak) IBOutlet UIImageView *mImageRotate;

- (IBAction)panView:(id)sender;

@end
