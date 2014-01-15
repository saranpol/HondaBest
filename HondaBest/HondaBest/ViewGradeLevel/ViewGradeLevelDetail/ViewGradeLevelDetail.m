//
//  ViewGradeLevelDetail.m
//  HondaBest
//
//  Created by saranpol on 1/14/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ViewGradeLevelDetail.h"
#import "CellGradeLevel.h"

@implementation ViewGradeLevelDetail

@synthesize mCollectionView;
@synthesize mPageControl;
@synthesize mPage;
@synthesize mImageBG;

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
    [mCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:mPage inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    [mPageControl setCurrentPage:mPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self scrollViewDidScroll:mCollectionView];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellGradeLevel *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellGradeLevel" forIndexPath:indexPath];
    [cell.mImageCar setImage:[UIImage imageNamed:[NSString stringWithFormat:@"gradelevel_car_%02d.png", (int)(indexPath.row+1)]]];
    [cell.mImageInCar setImage:[UIImage imageNamed:[NSString stringWithFormat:@"gradelevel_detail_%02d.png", (int)(indexPath.row+1)]]];
    [cell.mImageText setImage:[UIImage imageNamed:[NSString stringWithFormat:@"gradelevel_txt_%02d.png", (int)(indexPath.row+1)]]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGRect f = mImageBG.frame;
    CGFloat x = -scrollView.contentOffset.x/4.0;
    f.origin.x = x-150;
    [mImageBG setFrame:f];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    uint page = scrollView.contentOffset.x / mCollectionView.frame.size.width;
    [mPageControl setCurrentPage:page];
}


- (IBAction)clickBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
