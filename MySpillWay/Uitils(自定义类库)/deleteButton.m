//
//  deleteButton.m
//  TestPro
//
//  Created by uMac mini1 on 15/10/1.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

#import "deleteButton.h"

@implementation deleteButton

- (void)drawRect:(CGRect)rect {
    UIBezierPath* obliLeft = UIBezierPath.bezierPath;
    [obliLeft moveToPoint: CGPointMake(rect.size.width/1.5,rect.size.height/1.5)];
    [obliLeft addLineToPoint:CGPointMake(rect.size.width/3, rect.size.height/3)];
    [[UIColor grayColor] setStroke];
    obliLeft.lineCapStyle = kCGLineCapRound;
    obliLeft.lineWidth = 2;
    [obliLeft stroke];
    
    UIBezierPath* obliRight = UIBezierPath.bezierPath;
    [obliRight moveToPoint: CGPointMake(rect.size.width/1.5, rect.size.height/3)];
    [obliRight addLineToPoint:CGPointMake(rect.size.width/3, rect.size.height/1.5)];
    [[UIColor grayColor] setStroke];
    obliRight.lineCapStyle = kCGLineCapRound;
    obliRight.lineWidth = 2;
    [obliRight stroke];
}


@end
