//
//  ACAngleControl.m
//  AngleControl
//
//  Created by Max Winde on 19.08.13.
//  Copyright (c) 2013 nxtbgthng. All rights reserved.
//

#import "ACAngleControl.h"

@implementation ACAngleControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setValue:(float)value;
{
    if (value == _value) return;
    
    _value = value;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context); {
        CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2.0 - 1.0;
        CGFloat x = CGRectGetWidth(self.bounds) / 2.0;
        CGFloat y = CGRectGetHeight(self.bounds) / 2.0;
        
        CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextAddArc(context, x, y, radius, 0.0, M_PI * 2.0, NO);
        CGContextStrokePath(context);
        
    } CGContextRestoreGState(context);
}

@end
