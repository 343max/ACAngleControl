//
//  ACAngleControl.h
//  AngleControl
//
//  Created by Max Winde on 19.08.13.
//  Copyright (c) 2013 nxtbgthng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACAngleControl : UIControl

@property (assign, nonatomic) float angle;
@property (assign, nonatomic) float value;

@property (assign, nonatomic) float offsetAngle;
@property (assign, nonatomic) float minimumValue;
@property (assign, nonatomic) float maximumValue;

@end
