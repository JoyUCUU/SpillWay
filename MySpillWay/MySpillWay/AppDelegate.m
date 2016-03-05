//
//  AppDelegate.m
//  MySpillWay
//
//  Created by 刘华军 on 15/12/9.
//  Copyright © 2015年 JoyLiu. All rights reserved.
//

#import "AppDelegate.h"
#import "Bmob.h"
#import "SWRegistViewController.h"
#import "BlackTableViewController.h"
#import "WhiteTableViewController.h"
#import "ViewController.h"
#import "JTBaseNavigationController.h"
#import "JTNavigationController.h"
@interface AppDelegate ()
@property (nonatomic ,strong) UITabBarController *myTabBarViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化window
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    self.window.rootViewController = [[JTBaseNavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
//     开启全屏返回模式
    [JTBaseNavigationController shareNavgationController].fullScreenPopGestureEnable = YES;
    [JTBaseNavigationController shareNavgationController].backButtonImage = [UIImage imageNamed:@"backImage"];//设置返回按钮
    [self.window makeKeyAndVisible];
    
     UINavigationBar *bar=[UINavigationBar appearance];
     UIBarButtonItem *barItem=[UIBarButtonItem appearance];
    //2. 设置导航栏文字的主题
    [bar setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                  }];
    //设置navigationbaritem上面的颜色  该item上边的文字样式

    NSDictionary *fontDic=@{
                            NSForegroundColorAttributeName:[UIColor whiteColor],
                            NSFontAttributeName:[UIFont systemFontOfSize:16.f],  //粗体
                            };
    [barItem setTitleTextAttributes:fontDic
                           forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:fontDic
                           forState:UIControlStateHighlighted];
    // 5.设置状态栏样式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [Bmob registerWithAppKey:@"c1645bac8ec10a5d847a50d9fc93978a"];
    
   
    return YES;
}
-(void)sendPost{
    
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
