//
//  ViewESS.m
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewESS.h"
#import "CellFeature.h"

@implementation ViewESS

@synthesize mCollectionView;
@synthesize mPageControl;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellFeature *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellFeature" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            [cell.mImageFeature setImage:[UIImage imageNamed:@"s_04_ess.png"]];
            [cell.mLabelDescription setText:@"Emergency Stop Signal (ESS)\nสัญญาณไฟฉุกเฉินอัตโนมัติขณะเบรกกะทันหัน\n\n"];
            break;
        case 1:
            [cell.mImageFeature setImage:[UIImage imageNamed:@"s_05_hillstart.png"]];
            [cell.mLabelDescription setText:@"Hill Start Assist (HSA)\nระบบช่วยการออกตัวขณะอยู่บนทางลาดชัน\n\n"];
            break;
    }
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    uint page = scrollView.contentOffset.x / mCollectionView.frame.size.width;
    [mPageControl setCurrentPage:page];
}

@end
