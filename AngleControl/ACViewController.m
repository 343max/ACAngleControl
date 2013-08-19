//
//  ACViewController.m
//  AngleControl
//
//  Created by Max Winde on 19.08.13.
//  Copyright (c) 2013 nxtbgthng. All rights reserved.
//

#import "ACViewController.h"

@interface ACViewController ()

@end

@implementation ACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.angleControl.backgroundColor = [UIColor clearColor];
    self.angleControl.offsetAngle = -M_PI_2;
    self.angleControl.minimumValue = 1.0;
    self.angleControl.maximumValue = 4.0;
    self.angleControl.value = 3.0;
    
    [self.angleControl addTarget:self action:@selector(valueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    [self valueDidChange:nil];
}

- (void)valueDidChange:(id)sender
{
    self.angleLabel.text = [NSString stringWithFormat:@"angle: %f", self.angleControl.angle];
    self.valueLabel.text = [NSString stringWithFormat:@"value: %f", self.angleControl.value];
}

@end
