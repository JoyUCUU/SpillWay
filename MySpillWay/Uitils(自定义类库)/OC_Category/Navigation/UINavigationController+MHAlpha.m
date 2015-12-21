//
//  UINavigationController+MHAlpha.m
//  NavigationBar
//
//  Created by 吴双 on 15/11/3.
//  Copyright © 2015年 吴双. All rights reserved.
//

#import "UINavigationController+MHAlpha.h"
#import "UINavigationBar+Extension.h"
#import <objc/runtime.h>
//#import "MHMineInfoViewController.h"


static const char *kFromViewController = "fromViewController";
static const char *kToViewController   = "toViewController";
static const char *kAnimatedTime       = "animatedTime";
static const char *kNavigationBarColor = "navigationBarBackgroundColor";

@implementation NSObject (ChangeImplement)

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}

@end




@implementation UIViewController (MHNavigationController)



@end

@implementation UIViewController (MHAlpha)

+ (void)load {
    [self exchangeInstanceMethod1:@selector(viewDidLoad) method2:@selector(mh_viewDidLoad)];
    [self exchangeInstanceMethod1:@selector(viewWillAppear:) method2:@selector(mh_viewWillAppear:)];
    [self exchangeInstanceMethod1:@selector(viewWillDisappear:) method2:@selector(mh_viewWillDisappear:)];
    [self exchangeInstanceMethod1:@selector(viewDidAppear:) method2:@selector(mh_viewDidAppear:)];
}

- (void)animationDidStopWithTopViewController:(UIViewController *)topViewController {
    if ([self isKindOfClass:[UINavigationController class]]) {
        self.animatedTime = 0;
        UINavigationController *selfObj = (UINavigationController *)self;
        [selfObj.navigationBar setAlphaBackgroundColor:topViewController.navigationBarBackgroundColor];
    }
}

#pragma mark - 添加手势

- (void)handleNavigationTransition:(UIScreenEdgePanGestureRecognizer *)sender {
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *selfObj = (UINavigationController *)self;
        if (self.animatedTime++) {
            CGFloat progress = [sender translationInView:nil].x / [UIScreen mainScreen].bounds.size.width * 2;
            if (progress > 1) {
                progress = 1;
            }
            UIColor *fromColor = self.fromViewController.navigationBarBackgroundColor;
            UIColor *toColor = self.toViewController.navigationBarBackgroundColor;
            CGFloat fromR, fromG, fromB, fromA, toR, toG, toB, toA, lengthR, lengthG, lengthB, lengthA;
            [fromColor getRed:&fromR green:&fromG blue:&fromB alpha:&fromA];
            [toColor getRed:&toR green:&toG blue:&toB alpha:&toA];
            lengthR = toR - fromR; lengthG = toG - fromG; lengthB = toB - fromB; lengthA = toA - fromA;
            [selfObj.navigationBar setAlphaBackgroundColor:
             [UIColor colorWithRed:fromR + lengthR * progress
                             green:fromG + lengthG * progress
                              blue:fromB + lengthB * progress
                             alpha:fromA + lengthA * progress]
             ];
        }
    }
}

#pragma mark - 关联对象的get和set

- (void)setFromViewController:(UIViewController *)fromViewController {
    if([NSStringFromClass([fromViewController class]) rangeOfString:@"MHMineInfoViewController"].location != NSNotFound){
        [fromViewController.navigationController.navigationBar setShadowImage:nil];
        fromViewController.navigationController.navigationBar.tintColor= [UIColor redColor];
    }
    if([NSStringFromClass([fromViewController class]) rangeOfString:@"MHMineMaterialViewController"].location != NSNotFound){
        [fromViewController.navigationController.navigationBar setShadowImage:nil];
        fromViewController.navigationController.navigationBar.tintColor=[UIColor redColor];
    }
    if([NSStringFromClass([fromViewController class]) rangeOfString:@"MHModifyNickViewController"].location != NSNotFound||[NSStringFromClass([fromViewController class]) rangeOfString:@"MHModifyPersonSignViewController"].location != NSNotFound||[NSStringFromClass([fromViewController class]) rangeOfString:@"MHModifyDTIDViewController"].location != NSNotFound){
        [fromViewController.navigationController.navigationBar setShadowImage:[UIImage new]];
        fromViewController.navigationController.navigationBar.tintColor=[UIColor whiteColor];
        NSMutableDictionary *md = [NSMutableDictionary dictionary];
//        md[NSFontAttributeName] = [UIFont boldSystemFontOfSize:kNavTitleFontSize];
        md[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [fromViewController.navigationController.navigationBar setTitleTextAttributes:md];
    }
    [self willChangeValueForKey:[NSString stringWithUTF8String:kFromViewController]];
    objc_setAssociatedObject(self, kFromViewController, fromViewController, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:[NSString stringWithUTF8String:kFromViewController]];
}

- (UIViewController *)fromViewController {
    return objc_getAssociatedObject(self, kFromViewController);
}

- (void)setToViewController:(UIViewController *)toViewController {
    if([NSStringFromClass([toViewController class]) rangeOfString:@"MHMineInfoViewController"].location != NSNotFound){
        [toViewController.navigationController.navigationBar setShadowImage:[UIImage new]];
        toViewController.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    }
    if([NSStringFromClass([toViewController class]) rangeOfString:@"MHMineMaterialViewController"].location != NSNotFound){
        [toViewController.navigationController.navigationBar setShadowImage:[UIImage new]];
        toViewController.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    }
    if([NSStringFromClass([toViewController class]) rangeOfString:@"MHPersonInfoEditViewController"].location != NSNotFound){
        [toViewController.navigationController.navigationBar setShadowImage:[UIImage new]];
        toViewController.navigationController.navigationBar.tintColor=[UIColor whiteColor];
        toViewController.navigationBarBackgroundColor=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    }
    if([NSStringFromClass([toViewController class]) rangeOfString:@"MHModifyNickViewController"].location != NSNotFound||[NSStringFromClass([toViewController class]) rangeOfString:@"MHModifyPersonSignViewController"].location != NSNotFound||[NSStringFromClass([toViewController class]) rangeOfString:@"MHModifyDTIDViewController"].location != NSNotFound){
        [toViewController.navigationController.navigationBar setShadowImage:nil];
        toViewController.navigationController.navigationBar.tintColor=[UIColor redColor];
    }
    [self willChangeValueForKey:[NSString stringWithUTF8String:kToViewController]];
    objc_setAssociatedObject(self, kToViewController, toViewController, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:[NSString stringWithUTF8String:kToViewController]];
}

- (UIViewController *)toViewController {
    return objc_getAssociatedObject(self, kToViewController);
}

- (void)setAnimatedTime:(int)animatedTime {
    [self willChangeValueForKey:[NSString stringWithUTF8String:kAnimatedTime]];
    objc_setAssociatedObject(self, kAnimatedTime, @(animatedTime), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:[NSString stringWithUTF8String:kAnimatedTime]];
}

- (int)animatedTime {
    return [objc_getAssociatedObject(self, kAnimatedTime) intValue];
}

- (void)setNavigationBarBackgroundColor:(UIColor *)navigationBarBackgroundColor {
    [self willChangeValueForKey:[NSString stringWithUTF8String:kNavigationBarColor]];
    objc_setAssociatedObject(self, kNavigationBarColor, navigationBarBackgroundColor, OBJC_ASSOCIATION_RETAIN);
    [self didChangeValueForKey:[NSString stringWithUTF8String:kNavigationBarColor]];
}

- (UIColor *)navigationBarBackgroundColor {
    UIColor *c = objc_getAssociatedObject(self, kNavigationBarColor);
    if (!c) {
        c = MHAlphaDefaultNavigationBarBackgroundColor;
    }
    return c;
}

#pragma mark - 代替原有的方法

- (void)mh_viewDidLoad {
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *selfObj = (UINavigationController *)self;
        UIGestureRecognizer *recognizer = selfObj.interactivePopGestureRecognizer;
        [recognizer addTarget:self action:@selector(handleNavigationTransition:)];
    }
    [self mh_viewDidLoad];
}

- (void)mh_viewWillAppear:(BOOL)animated {
    self.navigationController.toViewController = self;
    [self mh_viewWillAppear:animated];
}

- (void)mh_viewDidAppear:(BOOL)animated {
    [self.navigationController animationDidStopWithTopViewController:self];
    [self mh_viewDidAppear:animated];
}

- (void)mh_viewWillDisappear:(BOOL)animated {
    self.navigationController.fromViewController = self;
    [self mh_viewWillDisappear:animated];
}
//- (UIBarButtonItem *)backButton{
//    NSDictionary*textAttributes;
//    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
//    //    temporaryBarButtonItem.title = @"返回";
//    temporaryBarButtonItem.target = self;
////    if ([temporaryBarButtonItem respondsToSelector:@selector(setTitleTextAttributes:forState:)]){
//        textAttributes = @{
//                           NSFontAttributeName: [UIFont boldSystemFontOfSize:kBackButtonFontSize],
//                           NSForegroundColorAttributeName: kMainColor,
//                           };
//        
//        [[UIBarButtonItem appearance] setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
////    }
//    temporaryBarButtonItem.action = @selector(goBack_Swizzle);
//    return temporaryBarButtonItem;
//}
//
//- (UIBarButtonItem *)backButton1{
//    NSDictionary*textAttributes;
//    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
//    //    temporaryBarButtonItem.title = @"返回";
//    temporaryBarButtonItem.target = self;
////    if ([temporaryBarButtonItem respondsToSelector:@selector(setTitleTextAttributes:forState:)]){
//        textAttributes = @{
//                           NSFontAttributeName: [UIFont boldSystemFontOfSize:kBackButtonFontSize],
//                           NSForegroundColorAttributeName: [UIColor whiteColor],
//                           };
//        
//        [[UIBarButtonItem appearance] setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
////    }
//    temporaryBarButtonItem.action = @selector(goBack_Swizzle);
//    return temporaryBarButtonItem;
//}
//
//- (void)goBack_Swizzle
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
@end










