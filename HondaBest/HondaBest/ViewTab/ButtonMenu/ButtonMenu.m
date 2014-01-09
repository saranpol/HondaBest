//
//  ButtonMenu.m
//  HondaBest
//
//  Created by saranpol on 1/9/2557 BE.
//  Copyright (c) 2557 Honda. All rights reserved.
//

#import "ButtonMenu.h"

@implementation ButtonMenu
@synthesize mLabel;

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
        
        UIFont *f = [UIFont fontWithName:@"DBHelvethaicaX-78BdCondIt" size:self.titleLabel.font.pointSize];
        CGRect r = self.titleLabel.frame;
        r.size.height = self.frame.size.height;
        r.origin.y = 6.0;
        r.origin.x = r.origin.x - 2.0;
        
        
        self.mLabel = [[UILabel alloc] initWithFrame:r];
        [mLabel setFont:f];
        [mLabel setTextColor:self.titleLabel.textColor];
        [mLabel setTextAlignment:NSTextAlignmentCenter];
        [mLabel setNumberOfLines:0];
        [mLabel setText:[self.titleLabel.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
        [mLabel setHighlightedTextColor:[UIColor whiteColor]];


        //NSLog(@"%@", mLabel.attributedText);
        
        NSMutableAttributedString *at = [[NSMutableAttributedString alloc] initWithAttributedString:mLabel.attributedText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentCenter;
        [paragraphStyle setLineHeightMultiple:0.6];
        [at addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [mLabel.text length])];
        mLabel.attributedText = at;

        [self addSubview:mLabel];
        [self.titleLabel setAlpha:0.0];
        
        [self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(buttonUp) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchCancel | UIControlEventTouchDragOutside];
        
        
    }
    return self;
}

- (void)buttonPressed {
    [mLabel setHighlighted:YES];
}

- (void)buttonUp {
    [mLabel setHighlighted:NO];
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
