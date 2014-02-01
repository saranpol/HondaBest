//
//  ViewPopupDetail.m
//  HondaBest
//
//  Created by saranpol on 1/16/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewPopupDetail.h"
#import "CellPopupDetail.h"
#import "HBViewController.h"

@implementation ViewPopupDetail

@synthesize mMode;
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
    NSInteger c = 0;
    if(mMode == MODE_EXTERIOR){
        c = 4;
    }else if(mMode == MODE_INTERIOR){
        c = 5;
    }
    [mPageControl setNumberOfPages:c];
    return c;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellPopupDetail *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellPopupDetail" forIndexPath:indexPath];

    NSString *iphone = @"_iphone.png";
    if(IDIOM == IPAD)
        iphone = @".jpg";
    if(mMode == MODE_EXTERIOR){
        switch (indexPath.row) {
            case 0:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"B-Exterior-popup_01%@", iphone]]];
                [cell.mLabel setText:@"กระจังหน้าดีไซน์พิเศษแบบแพลทินัม"];
                break;
            case 1:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"B-Exterior-popup_02%@", iphone]]];
                [cell.mLabel setText:@"ล้ออัลลอยขนาด 16 นิ้ว ดีไซน์สปอร์ต"];
                break;
            case 2:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"B-Exterior-popup_03%@", iphone]]];
                [cell.mLabel setText:@"เสาอากาศแบบครีบฉลาม (Shark Fin)"];
                break;
            case 3:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"B-Exterior-popup_04%@", iphone]]];
                [cell.mLabel setText:@"ไฟท้ายดีไซน์พรีเมียม"];
                break;
        }
    }else if(mMode == MODE_INTERIOR){
        switch (indexPath.row) {
//            case 0:
//                [cell.mImage setImage:[UIImage imageNamed:@"02-B-Interior-popup-01.jpg"]];
//                [cell.mLabel setText:@"ช่องเชื่อมต่อ USB 2 ตำแหน่ง พร้อมช่องเชื่อมต่อ HDMI"];
//                break;
//            case 1:
//                [cell.mImage setImage:[UIImage imageNamed:@"02-B-Interior-popup-02.jpg"]];
//                [cell.mLabel setText:@"ระบบเครื่องปรับอากาศอัตโนมัติพร้อมแผงควบคุมแบบสัมผัส"];
//                break;
            case 0:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"02-B-Interior-popup-03%@", iphone]]];
                [cell.mLabel setText:@"ที่วางแก้วน้ำบริเวณคอนโซลหน้า แผงข้างประตู และบริเวณพนักเท้าแขนด้านหลัง"];
                break;
            case 1:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"02-B-Interior-popup-04%@", iphone]]];
                [cell.mLabel setText:@"ลำโพง 8 ตำแหน่ง"];
                break;
            case 2:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"02-B-Interior-popup-05%@", iphone]]];
                [cell.mLabel setText:@"ช่องเชื่อมต่อ USB 2 ตำแหน่ง พร้อมช่องเชื่อมต่อ HDMI"];
                break;
            case 3:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"02-B-Interior-popup-06%@", iphone]]];
                [cell.mLabel setText:@"ช่องจ่ายไฟสำรองด้านหลัง 2 ตำแหน่ง"];
                break;
            case 4:
                [cell.mImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"02-B-Interior-popup-07%@", iphone]]];
                [cell.mLabel setText:@"ห้องสัมภาระด้านท้าย"];
                break;
//            case 7:
//                [cell.mImage setImage:[UIImage imageNamed:@"02-B-Interior-popup-08.jpg"]];
//                [cell.mLabel setText:@"พวงมาลัยแบบมัลติฟังก์ชั่น"];
//                break;
        }
    }

    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    uint page = scrollView.contentOffset.x / mCollectionView.frame.size.width;
    [mPageControl setCurrentPage:page];
}

- (IBAction)clickClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
