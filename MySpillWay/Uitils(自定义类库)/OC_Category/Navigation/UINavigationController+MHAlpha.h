//
//  UINavigationController+MHAlpha.h
//  NavigationBar
//
//  Created by 吴双 on 15/11/3.
//  Copyright © 2015年 吴双. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  导航栏跳转颜色变化，只需要在每个UIViewController里设置自己的navigationBarBackgoundColor即可。
 */


/**
 *  默认导航栏背景颜色，自定义修改。全局有效。
 */
#define MHAlphaDefaultNavigationBarBackgroundColor [UIColor whiteColor]

@interface UIViewController (MHAlpha)

/**
 *  导航栏的背景颜色
 */
@property (nonatomic, strong) UIColor *navigationBarBackgroundColor;

@end
