//
//  ACViewController.h
//  AngleControl
//
//  Created by Max Winde on 19.08.13.
//  Copyright (c) 2013 nxtbgthng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ACAngleControl.h"

@interface ACViewController : UIViewController

@property (weak) IBOutlet ACAngleControl *angleControl;
@property (weak, nonatomic) IBOutlet UILabel *angleLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
