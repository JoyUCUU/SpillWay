//
//  UIViewController+Swizzle.m
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-1.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import "ObjcRuntime.h"
#import "RDVTabBarController.h"


@implementation UIViewController (Swizzle)
- (void)customViewDidAppear:(BOOL)animated{
    
    if ([NSStringFromClass([self class]) rangeOfString:@"MHHeadlineViewController"].location != NSNotFound) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
        DebugLog(@"setTabBarHidden:NO --- customViewDidAppear : %@", NSStringFromClass([self class]));
    }
    if ([NSStringFromClass([self class]) rangeOfString:@"MHCommunityViewController"].location != NSNotFound) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
        DebugLog(@"setTabBarHidden:NO --- customViewDidAppear : %@", NSStringFromClass([self class]));
    }
    if ([NSStringFromClass([self class]) rangeOfString:@"MHActivityViewController"].location != NSNotFound) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
        DebugLog(@"setTabBarHidden:NO --- customViewDidAppear : %@", NSStringFromClass([self class]));
    }
    if ([NSStringFromClass([self class]) rangeOfString:@"MHMessageViewController"].location != NSNotFound) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
        DebugLog(@"setTabBarHidden:NO --- customViewDidAppear : %@", NSStringFromClass([self class]));
    }
    if ([NSStringFromClass([self class]) rangeOfString:@"MHDiscoveryViewController"].location != NSNotFound) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
        DebugLog(@"setTabBarHidden:NO --- customViewDidAppear : %@", NSStringFromClass([self class]));
    }
    [self customViewDidAppear:animated];
}

- (void)customViewWillDisappear:(BOOL)animated{
//    返回按钮
//    if (!self.navigationItem.backBarButtonItem
//        && self.navigationController.viewControllers.count > 1) {//设置返回按钮(backBarButtonItem的图片不能设置；如果用leftBarButtonItem属性，则iOS7自带的滑动返回功能会失效)
//        self.navigationItem.backBarButtonItem = [self backButton];
//    }
//    if([NSStringFromClass([self class]) rangeOfString:@"MHMineInfoViewController"].location != NSNotFound){
//        self.navigationItem.backBarButtonItem = [self backButton];
//        self.navigationController.navigationBar.tintColor=kMainColor;
//    }
    [self customViewWillDisappear:animated];
}

- (void)customviewWillAppear:(BOOL)animated{
    if ([[self.navigationController childViewControllers] count] > 1) {
        [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
        DebugLog(@"setTabBarHidden:YES --- customviewWillAppear : %@", NSStringFromClass([self class]));
    }
//    if([NSStringFromClass([self class]) rangeOfString:@"MHMineInfoViewController"].location != NSNotFound){
//        self.navigationItem.backBarButtonItem = [self backButton1];
//        self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
//    }
    [self customviewWillAppear:animated];
}

+ (void)load{
    swizzleAllViewController();
}
@end

void swizzleAllViewController()
{
    Swizzle([UIViewController class], @selector(viewDidAppear:), @selector(customViewDidAppear:));
    Swizzle([UIViewController class], @selector(viewWillDisappear:), @selector(customViewWillDisappear:));
    Swizzle([UIViewController class], @selector(viewWillAppear:), @selector(customviewWillAppear:));
}