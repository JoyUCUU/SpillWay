//
//  Configure.h
//  huashen
//
//  Created by Arthury on 15/8/20.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

#ifndef MH_Configure_h
#define MH_Configure_h

#ifdef __OBJC__
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Masonry/Masonry.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <RegexKitLite-NoWarning/RegexKitLite.h>
#import <JSONKit/JSONKit.h>
#import <MJRefresh/MJRefresh.h>

#import "UIImageView+WebCache.h"
#import "NSDate+convenience.h"
#import "NSDate+Common.h"
#import "NSString+Common.h"
#import "UIImage+Common.h"
#import "CAGradientLayer+SJSGradients.h"
#import "CALayer+Additions.h"
#import "UIColor+expanded.h"
#import "NSObject+Common.h"
#import "NSObject+ObjectMap.h"
#import "UIView+Frame.h"
#import "UIView+Common.h"
#import "UIActionSheet+Common.h"
#import "NSDictionary+NSNullToNil.h"


#import "MHGlobalFunction.h"
#import "MH_NetAPIManager.h"
#import "MH_UploadImageManager.h"
#import "WebContentManager.h"
#import "MHUserManager.h"

#import "UITapImageView.h"
#import "AppDelegate.h"




#endif

#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define appMHDelegate ((MHAppDelegate *)[[UIApplication sharedApplication] delegate])

#define IPHONE_5_NEW (([UIScreen mainScreen].bounds.size.height == 568) ? YES : NO)
#define IPHONE_6_NEW (([UIScreen mainScreen].bounds.size.height == 667) ? YES : NO)
#define IPHONE_6p_NEW (([UIScreen mainScreen].bounds.size.height == 736) ? YES : NO)

//屏蔽使用PerformSelector会引起的警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

//判断SDK的版本
#define SDKVersion7         (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)?YES:NO)
#define SDKVersion7_1       (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.09)?YES:NO)
#define SDKVersion8         (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)?YES:NO)

//设置字体各个类型的大小
#define Font_Size_Small  10
#define Font_Size_Middle 13
#define Font_Size_Large  16
#define Font_Size_Huge   20
#define Font_Size_Small_Index  0
#define Font_Size_Middle_Index 1
#define Font_Size_Large_Index  2
#define Font_Size_Huge_Index   3


#define IcardColor(x,y,z,a) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:a]


#define COLOR_MAIN [UIColor colorWithRed:247/255.0 green:109/255.0 blue:62/255.0 alpha:1.0]
#define COLOR_GRAY [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1.0]
#define COLOR_STRING [UIColor colorWithRed:115/255.0 green:113/255.0 blue:112/255.0 alpha:1.0]
#define COLOR_STRING_LIGHT [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0]
#define COLOR_LINE  [UIColor colorWithRed:220/255.0 green:219/255.0 blue:219/255.0 alpha:1.0]
#define COLOR_BLACK_ICard [UIColor blackColor]
#define COLOR_ORANGE  IcardColor(255,147,12,1.0)


#endif
