//
//  ArrowRight.m
//  vomoho
//
//  Created by Arthury on 15/9/23.
//  Copyright © 2015年 AloesLu. All rights reserved.
//

#import "ArrowRight.h"

@implementation ArrowRight

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIBezierPath* arrowUpPath = UIBezierPath.bezierPath;
    [arrowUpPath moveToPoint: CGPointMake(rect.origin.x + rect.size.width/2,rect.origin.y+1)];
    [arrowUpPath addLineToPoint:CGPointMake(rect.origin.x + rect.size.width-1, rect.origin.y + rect.size.height/2)];
    [arrowUpPath addLineToPoint:CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height-1)];
    [[UIColor colorWithRed:0.8  green:0.8  blue:0.8 alpha:1] setStroke];
    arrowUpPath.lineCapStyle = kCGLineCapSquare;
    arrowUpPath.lineWidth = 2;
    [arrowUpPath stroke];
}


@end

