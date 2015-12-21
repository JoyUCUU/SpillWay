//
//  huashenGlobalData.h
//  huashen
//
//  Created by Arthury on 15/8/22.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Reachability;

@interface huashenGlobalData : NSObject

@property (nonatomic,assign) NSUserDefaults *userDefaults;
@property (nonatomic) Reachability *networkReach;

+ (instancetype) sharedGlobalData;

@end
