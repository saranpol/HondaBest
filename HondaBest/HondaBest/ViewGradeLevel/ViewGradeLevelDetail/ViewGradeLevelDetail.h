//
//  ViewGradeLevelDetail.h
//  HondaBest
//
//  Created by saranpol on 1/14/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewGradeLevelDetail : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *mCollectionView;
@property (nonatomic, weak) IBOutlet UIPageControl *mPageControl;
@property (nonatomic, assign) NSInteger mPage;
@property (nonatomic, weak) IBOutlet UIImageView *mImageBG;

- (IBAction)clickBack:(id)sender;
- (IBAction)clickLeft:(id)sender;
- (IBAction)clickRight:(id)sender;

@end
