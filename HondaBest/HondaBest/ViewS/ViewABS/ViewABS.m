//
//  ViewABS.m
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewABS.h"
#import "CellFeature.h"

@implementation ViewABS

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
        case 0:{
            //[cell.mImageFeature setImage:[UIImage imageNamed:@"s_02_abs.png"]];
            [cell.mImageFeature setImage:[UIImage imageNamed:@"S_02_ABS_snap.png"]];
            [cell.mLabelDescription setText:@"ระบบเบรกป้องกันล้อล็อก ABS ช่วยให้สามารถควบคุมการบังคับพวงมาลัยเมื่อต้องเบรกกะทันหัน\nพร้อมระบบกระจายแรงเบรก EBD เพิ่มประสิทธิภาพการเบรกให้มีความสมดุลมากขึ้น\n\n"];
            [cell setupVideo:@"S_02_ABS"];
            break;
        }
        case 1:
            //[cell.mImageFeature setImage:[UIImage imageNamed:@"s_03_vsa.png"]];
            [cell.mImageFeature setImage:[UIImage imageNamed:@"S_03_VSA_snap.png"]];
            [cell.mLabelDescription setText:@"Vehicle Stability Assist (VSA) ระบบช่วยควบคุมการทรงตัวขณะเข้าโค้ง\nเพิ่มการยึดเกาะถนน มั่นคงทุกการขับเคลื่อน\n\n"];
            [cell setupVideo:@"S_03_VSA"];
            break;
    }
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    uint page = scrollView.contentOffset.x / mCollectionView.frame.size.width;
    [mPageControl setCurrentPage:page];
    for (CellFeature *cell in [mCollectionView visibleCells]) {
        [cell.mPlayer.view setHidden:NO];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (CellFeature *cell in [mCollectionView visibleCells]) {
        [cell.mPlayer.view setHidden:YES];
    }
}

@end
