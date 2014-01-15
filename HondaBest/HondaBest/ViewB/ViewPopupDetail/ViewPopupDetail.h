//
//  ViewPopupDetail.h
//  HondaBest
//
//  Created by saranpol on 1/16/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    MODE_EXTERIOR,
    MODE_INTERIOR
};

@interface ViewPopupDetail : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, assign) NSInteger mMode;
@property (nonatomic, weak) IBOutlet UICollectionView *mCollectionView;
@property (nonatomic, weak) IBOutlet UIPageControl *mPageControl;

- (IBAction)clickClose:(id)sender;

@end
