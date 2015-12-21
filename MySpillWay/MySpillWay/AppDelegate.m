//
//  AppDelegate.m
//  MySpillWay
//
//  Created by 刘华军 on 15/12/9.
//  Copyright © 2015年 JoyLiu. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworking.h>
#import "SWRegistViewController.h"
#import "SWMainPageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    //创建登陆初始界面、和注册界面
    SWRegistViewController *rVC = [[SWRegistViewController alloc] init];
    SWMainPageViewController *mpVC = [[SWMainPageViewController alloc] init];
    [self.window addSubview:rVC.view];
    [self.window addSubview:mpVC.view];
    
    //将登陆初始界面的初始界面放在前面
    [self.window bringSubviewToFront:rVC.view];
//    [self.window makeKeyAndVisible];
    self.window.rootViewController = rVC;
    
   
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   }

- (void)applicationDidEnterBackground:(UIApplication *)application {
   }

- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
