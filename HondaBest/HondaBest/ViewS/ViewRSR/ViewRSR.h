//
//  ViewRSR.h
//  HondaBest
//
//  Created by saranpol on 1/13/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewRSR : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *mImageRSR;
@property (nonatomic, weak) IBOutlet UIButton *mButtonGuide;

- (IBAction)clickButtonGuide:(id)sender;

@end
