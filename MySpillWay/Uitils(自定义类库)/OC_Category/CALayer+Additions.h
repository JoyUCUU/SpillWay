//
//  CALayer+Additions.h
//  vomoho
//
//  Created by AloesLu on 15/9/16.
//  Copyright (c) 2015年 AloesLu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Additions)

@property(nonatomic, assign) UIColor *borderUIColor;

- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
