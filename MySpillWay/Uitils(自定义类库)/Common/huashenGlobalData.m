////
////  huashenGlobalData.m
////  huashen
////
////  Created by Arthury on 15/8/22.
////  Copyright (c) 2015年 Arthury. All rights reserved.
////
//
//#import "huashenGlobalData.h"
//#import "Configure.h"
//#import <AdSupport/ASIdentifierManager.h>
//
//
//@implementation huashenGlobalData
//
//+ (instancetype)sharedGlobalData{
//    static huashenGlobalData *sharedInstance = nil;
//    static dispatch_once_t onceTolen; //锁
//    dispatch_once(&onceTolen,^{
//        //最多调用一次
//        sharedInstance = [[self alloc] init];
//    });
//    return sharedInstance;
//}
//
//
////当第一次使用这个单例的时候，会调用这个init方法
//-(id)init{
//    self = [super init];
//    
//    if(self){
//        
//        self.userDefaults = [NSUserDefaults standardUserDefaults];
//        
//        //获取udid
//        [self.userDefaults setObject:[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] forKey:DeviceID];
//        
//        /**
//         *  object:@"ios" key:DeviceType
//         */
//        [self.userDefaults setObject:[NSString stringWithFormat:@"%@", @"ios"] forKey:DeviceType];
//
//        
//        /**
//         *  注册一个观察者，监听网络状况的变化
//         *
//         *  @param networkStatusChange:
//         *
//         *  @return
//         */
//        /**
//         *  通过访问百度来判断当前的网络状况，这个是Reachability的使用规则
//         */
//        self.networkReach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(networkStatusChange:)
//                                                     name:kReachabilityChangedNotification
//                                                   object:nil];
//        
//        [self.networkReach startNotifier];
//        
//    }
//    return self;
//}
//
//
//- (void)networkStatusChange:(NSNotification *)notification{
//    
//    switch (self.networkReach.currentReachabilityStatus) {
//        case NotReachable:
//            break;
//        case ReachableViaWWAN://手机自带网络
//            [self dealWithWWAN];
//            break;
//        case ReachableViaWiFi://WIFI
//            [self dealWithWiFi];
//            break;
//    }
//}
//
///**
// *  只要这个实例一直存在，那么监听就会有效果
// */
//- (void)dealWithWWAN{
//    
//    /**
//     *  假如使用的是实际网络并且读取出来是无图模式(也就是看用户有没有开启2g/3g下使用图片模式了)
//     */
//    if ([self.userDefaults boolForKey:NoImageModeSet]) {
//        /**
//         *  object:YES key:@"no_image_mode_flag" //无图模式将会标记为YES
//         */
//        [self.userDefaults setBool:YES forKey:NoImageModeFlag];
//    }else{
//        /**
//         *  object:NO key:@"no_image_mode_flag" //否则无图模式将会标记为NO
//         */
//        [self.userDefaults setBool:NO forKey:NoImageModeFlag];
//    }
//}
//
//- (void)dealWithWiFi{
//    
//    /**
//     *  如果使用的是WIFI
//     object:NO key:@"no_image_mode_flag" //不使用无图模式
//     */
//    [self.userDefaults setBool:NO forKey:NoImageModeFlag];
//}
//
//
//@end
