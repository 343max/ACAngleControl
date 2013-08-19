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

}

@end
