//
//  ViewUtil.h
//  Panda
//
//  Created by saranpol on 10/13/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewUtil : NSObject

//+ (void)loadImage:(UIImageView*)v url:(NSString*)url;
//+ (void)loadButtonImage:(UIButton*)v url:(NSString*)url;
+ (void)addViewFade:(UIView*)parent view:(UIView*)v;
+ (void)addViewFade:(UIView*)parent view:(UIView*)v finalAlpha:(CGFloat)finalAlpha;
+ (void)removeViewFade:(UIView*)v;
+ (void)setFrameWidth:(UIView*)v w:(float)w;

@end
