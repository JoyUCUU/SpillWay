//
//  CALayer+Additions.m
//  vomoho
//
//  Created by AloesLu on 15/9/16.
//  Copyright (c) 2015年 AloesLu. All rights reserved.
//

#import "CALayer+Additions.h"
#import <QuartzCore/QuartzCore.h>

@implementation CALayer (Additions)

- (void)setBorderColorFromUIColor:(UIColor *)color{
    self.borderColor=color.CGColor;
}

- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
