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
        [self commonAwake];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonAwake];
    }
    return self;
}

- (void)commonAwake;
{
    _minimumValue = 0.0;
    _maximumValue = M_PI * 2.0;
}

- (void)setValue:(float)value;
{
    if (value == _value) return;
    
    _value = value;
    
    [self setNeedsDisplay];
}

- (float)angle;
{
    float angle = self.value;
    angle -= self.minimumValue;
    angle = angle / (self.maximumValue - self.minimumValue) * M_PI * 2.0;
    return angle;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context); {
        CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2.0 - 2.0;
        CGFloat x = CGRectGetWidth(self.bounds) / 2.0;
        CGFloat y = CGRectGetHeight(self.bounds) / 2.0;
        
        CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextSetLineWidth(context, 0.5);
        CGContextAddArc(context, x, y, radius, 0.0, M_PI * 2.0, NO);
        CGContextStrokePath(context);
        
        float angle = [self angle];
        float a = sinf(angle) * radius;
        float b = cosf(angle) * radius;
        
        CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
        CGContextSetLineWidth(context, 3.0);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextMoveToPoint(context, x, y);
        CGContextAddLineToPoint(context, x + b, y + a);
        CGContextStrokePath(context);
    } CGContextRestoreGState(context);
}

@end
