//
//  ViewESS.m
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewESS.h"
#import "CellFeature.h"
#import "HBViewController.h"

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
            if(IDIOM == IPAD){
                [cell.mImageFeature setImage:[UIImage imageNamed:@"s_04_ess_snap.png"]];
                [cell setupVideo:@"S_04_ess"];
            }else{
                [cell.mImageFeature setImage:[UIImage imageNamed:@"s_04_ess_snap_iphone.png"]];
                [cell setupVideo:@"S_04_ess_iphone"];
            }
            [cell.mLabelDescription setText:@"Emergency Stop Signal (ESS)\nสัญญาณไฟฉุกเฉินอัตโนมัติขณะเบรกกะทันหัน\n\n"];
            break;
        case 1:
            if(IDIOM == IPAD){
                [cell.mImageFeature setImage:[UIImage imageNamed:@"S_07_hillstart_snap.png"]];
                [cell setupVideo:@"S_07_hillstart"];
            }else{
                [cell.mImageFeature setImage:[UIImage imageNamed:@"S_07_hillstart_snap_iphone.png"]];
                [cell setupVideo:@"S_07_hillstart_iphone"];
            }
            [cell.mLabelDescription setText:@"Hill Start Assist (HSA)\nระบบช่วยการออกตัวขณะอยู่บนทางลาดชัน\n\n"];
            break;
    }
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    uint page = scrollView.contentOffset.x / mCollectionView.frame.size.width;
    [mPageControl setCurrentPage:page];
    for (CellFeature *cell in [mCollectionView visibleCells]) {
        if(cell.mPlayer)
            [cell.mPlayer.view setHidden:NO];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (CellFeature *cell in [mCollectionView visibleCells]) {
        if(cell.mPlayer)
            [cell.mPlayer.view setHidden:YES];
    }
}


@end
