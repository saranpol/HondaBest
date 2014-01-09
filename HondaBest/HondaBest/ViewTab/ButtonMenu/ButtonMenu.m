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


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *v = [super hitTest:point withEvent:event];
    if(v == self){
        float x = point.x;
        float y = 74 - point.y;
        if(x<=0)
            x=0.1;
        if(y<=0)
            y=0.1;
        float slope = y/x;
        if(slope < 74.0/30.0)
            return self;
        return nil;
    }
    return v;
}

@end
