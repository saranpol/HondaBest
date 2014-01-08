//
//  ButtonMenu.m
//  HondaBest
//
//  Created by saranpol on 1/9/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ButtonMenu.h"

@implementation ButtonMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        UIImage *m = [self.currentBackgroundImage stretchableImageWithLeftCapWidth:32 topCapHeight:0];
        [self setBackgroundImage:m forState:UIControlStateNormal];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
