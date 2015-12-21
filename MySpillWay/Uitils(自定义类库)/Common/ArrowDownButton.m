//
//  ArrowDownButton.m
//  vomoho
//
//  Created by Arthury on 15/9/23.
//  Copyright © 2015年 AloesLu. All rights reserved.
//

#import "ArrowDownButton.h"

@implementation ArrowDownButton

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIBezierPath *roundedRectRadii = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(9, 9)];
    if (self.pathFillColor) {
        [self.pathFillColor setFill];
    }else{
        [[UIColor whiteColor] setFill];
    }
    roundedRectRadii.lineWidth = 1;
    [roundedRectRadii fill];
    
    UIBezierPath* arrowDownPath = UIBezierPath.bezierPath;
    [arrowDownPath moveToPoint: CGPointMake(rect.origin.x + 6, rect.origin.y + rect.size.height/2-3)];
    [arrowDownPath addLineToPoint:CGPointMake(rect.origin.x + rect.size.width/2,rect.origin.y + rect.size.height/1.4-3)];
    [arrowDownPath addLineToPoint:CGPointMake(rect.origin.x + rect.size.width - 6, rect.origin.y + rect.size.height/2-3)];
    [[UIColor colorWithRed:0.667  green:0.722  blue:0.722 alpha:1] setStroke];
    arrowDownPath.lineCapStyle = kCGLineCapRound;
    arrowDownPath.lineWidth = 2;
    [arrowDownPath stroke];
}


@end