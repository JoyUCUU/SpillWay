//
//  ArrowLeft.m
//  KZPlayground
//
//  Created by Arthury on 15/8/30.
//  Copyright (c) 2015年 Krzysztof Zablocki. All rights reserved.
//

#import "ArrowLeft.h"

@implementation ArrowLeft

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIBezierPath* arrowUpPath = UIBezierPath.bezierPath;
    [arrowUpPath moveToPoint: CGPointMake(rect.origin.x + rect.size.width/2,rect.origin.y + 5)];
    [arrowUpPath addLineToPoint:CGPointMake(rect.origin.x + 7, rect.origin.y + rect.size.height/2)];
    [arrowUpPath addLineToPoint:CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height -5 )];
    [[UIColor orangeColor] setStroke];
    arrowUpPath.lineCapStyle = kCGLineCapRound;
    arrowUpPath.lineWidth = 3;
    [arrowUpPath stroke];
}


@end
