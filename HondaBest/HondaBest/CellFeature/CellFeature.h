//
//  CellFeature.h
//  HondaBest
//
//  Created by saranpol on 1/10/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CellFeature : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *mImageFeature;
@property (nonatomic, weak) IBOutlet UILabel *mLabelDescription;
@property (nonatomic, strong) MPMoviePlayerController *mPlayer;

- (void)setupVideo:(NSString*)video;

@end
