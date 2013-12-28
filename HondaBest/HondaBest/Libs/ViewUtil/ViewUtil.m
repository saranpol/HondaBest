//
//  ViewUtil.m
//  Panda
//
//  Created by saranpol on 10/13/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import "ViewUtil.h"
//#import "UIImageView+WebCache.h"
//#import "UIButton+WebCache.h"

@implementation ViewUtil

//+ (void)loadImage:(UIImageView*)v url:(NSString*)url {
//    UIImageView *iv = v;
//    [v setImageWithURL:[NSURL URLWithString:url]
//             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType){
//                 if(cacheType!=SDImageCacheTypeMemory){
//                     [iv setAlpha:0.0];
//                     [UIView animateWithDuration:0.3 animations:^{
//                         [iv setAlpha:1.0];
//                     }];
//                 }
//             }];
//}
//
//+ (void)loadButtonImage:(UIButton*)v url:(NSString*)url {
//    UIButton *iv = v;
//    [v setImageWithURL:[NSURL URLWithString:url]
//              forState:UIControlStateNormal
//             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType){
//                 if(cacheType!=SDImageCacheTypeMemory){
//                     [iv setAlpha:0.0];
//                     [UIView animateWithDuration:0.3 animations:^{
//                         [iv setAlpha:1.0];
//                     }];
//                 }
//             }];
//}


+ (void)addViewFade:(UIView*)parent view:(UIView*)v {
    [ViewUtil addViewFade:parent view:v finalAlpha:1.0];
}

+ (void)addViewFade:(UIView*)parent view:(UIView*)v finalAlpha:(CGFloat)finalAlpha {
    [parent addSubview:v];
    [v setAlpha:0.0];
    [parent setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.3 animations:^{
        [v setAlpha:finalAlpha];
    }completion:^(BOOL finished){
        [parent setUserInteractionEnabled:YES];
    }];
}

+ (void)removeViewFade:(UIView*)v {
    [v setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.3 animations:^{
        [v setAlpha:0.0];
    }completion:^(BOOL finished){
        [v setUserInteractionEnabled:YES];
//        if(finished){
            [v removeFromSuperview];
//        }
    }];
}

+ (void)setFrameWidth:(UIView*)v w:(float)w {
    CGRect f = v.frame;
    f.size.width = w;
    [v setFrame:f];
}

@end
