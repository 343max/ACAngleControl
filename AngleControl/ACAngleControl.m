//
//  ACAngleControl.m
//  AngleControl
//
//  Created by Max Winde on 19.08.13.
//  Copyright (c) 2013 nxtbgthng. All rights reserved.
//

#import "ACAngleControl.h"

@interface ACAngleControl ()

@property (strong) UIPanGestureRecognizer *tapGestureRecognizer;

@end


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
    
    self.tapGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panningDidChange:)];
    [self addGestureRecognizer:self.tapGestureRecognizer];
}

- (void)panningDidChange:(UIPanGestureRecognizer *)panGestureRecognizer;
{
    if (panGestureRecognizer.numberOfTouches != 1) return;
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGPoint location = [panGestureRecognizer locationOfTouch:0 inView:self];
    CGPoint offset = CGPointMake(location.x - center.x, location.y - center.y);
    
    float angle = atanf(offset.y / offset.x);
    if (offset.x < 0) angle += M_PI;
    if (angle < 0) angle += 2 * M_PI;
    
    NSLog(@"angle: %f", angle);
    self.angle = angle;
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setValue:(float)value;
{
    self.angle = value;
}

- (float)value;
{
    return self.angle;
}

- (void)setAngle:(float)angle;
{
    if (angle == _angle) return;
    _angle = angle;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context); {
        CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2.0 - 2.0;
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        
        CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextSetLineWidth(context, 0.5);
        CGContextAddArc(context, center.x, center.y, radius, 0.0, M_PI * 2.0, NO);
        CGContextStrokePath(context);
        
        float angle = [self angle];
        float a = sinf(angle) * radius;
        float b = cosf(angle) * radius;
        
        CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
        CGContextSetLineWidth(context, 3.0);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextMoveToPoint(context, center.x, center.y);
        CGContextAddLineToPoint(context, center.x + b, center.y + a);
        CGContextStrokePath(context);
    } CGContextRestoreGState(context);
}

@end
