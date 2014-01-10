//
//  ViewABS.h
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewABS : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *mCollectionView;
@property (nonatomic, weak) IBOutlet UIPageControl *mPageControl;

@end
