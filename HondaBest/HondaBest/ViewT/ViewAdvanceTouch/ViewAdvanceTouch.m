//
//  ViewAdvanceTouch.m
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewAdvanceTouch.h"
#import "CellFeature.h"
#import "HBViewController.h"

@implementation ViewAdvanceTouch

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
    return 8;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellFeature *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellFeature" forIndexPath:indexPath];
    
    NSString *iphone = @"_iphone";
    if(IDIOM == IPAD)
        iphone = @"";
    
    switch (indexPath.row) {
        case 0:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_04_advanced%@.png", iphone]]];
            [cell.mLabelDescription setText:@"ระบบเครื่องเสียงหน้าจอสัมผัสขนาด 7 นิ้ว\nแบบ Advanced Touch\n\n"];
            break;
        case 1:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_05_hondalink%@.png", iphone]]];
            [cell.mLabelDescription setText:@"HondaLink Application\n*เฉพาะ Smart Phone บางรุ่น\n\n"];
            break;
        case 2:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_06_hdmi%@.png", iphone]]];
            [cell.mLabelDescription setText:@"HDMI\nรองรับการเชื่อมต่อภาพ และเสียงผ่าน HDMI\n\n"];
            break;
        case 3:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_07_handsFee%@.png", iphone]]];
            [cell.mLabelDescription setText:@"Hands Free Telephone\nหน้าจอแสดงผลการเชื่อมต่อโทรศัพท์ไร้สาย\n\n"];
            break;
        case 4:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_08_siri%@.png", iphone]]];
             [cell.mLabelDescription setText:@"Siri Eyes Free Mode\nรองรับระบบสั่งการด้วยเสียง Siri *สำหรับ iPhone รุ่น 4s ขึ้นไป\n\n"];
            break;
        case 5:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_09_ipod%@.png", iphone]]];
              [cell.mLabelDescription setText:@"Audio Display\nหน้าจอแสดงผลในโหมดเครื่องเสียง\n\n"];
            break;
        case 6:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_10_fueldisplay%@.png", iphone]]];
               [cell.mLabelDescription setText:@"Fuel Consumption Display\nหน้าจอแสดงผลอัตราสิ้นเปลืองน้ำมันเชื้อเพลิง\n\n"];
            break;
        case 7:
            [cell.mImageFeature setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t_11_navigation%@.png", iphone]]];
                [cell.mLabelDescription setText:@"Navigation\nรองรับ HondaLink Navigation Application\n*เฉพาะ Smart Phone บางรุ่น\n\n"];
            break;
    }
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    uint page = scrollView.contentOffset.x / mCollectionView.frame.size.width;
    [mPageControl setCurrentPage:page];
}

@end
