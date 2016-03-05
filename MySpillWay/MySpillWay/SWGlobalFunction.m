//
//  SWGlobalFunction.m
//  MySpillWay
//
//  Created by 刘华军 on 16/3/4.
//  Copyright © 2016年 JoyLiu. All rights reserved.
//

#import "SWGlobalFunction.h"
#import <UIKit/UIKit.h>
@implementation SWGlobalFunction

/*
 * 方法说明：功能说明（使用iconfont字体格式创建UIButton）
 * 修改记录：（）
 */
+ (UIButton *)getNavBarButtonItem:(NSString *)title{
    UIFont *iconfont=[UIFont fontWithName:@"iconfont" size:25];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:iconfont];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    return button;
}
@end
