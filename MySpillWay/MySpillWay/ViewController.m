//
//  ViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 15/12/9.
//  Copyright © 2015年 JoyLiu. All rights reserved.
//

#import "ViewController.h"
#import "BlackTableViewController.h"
#import "WhiteTableViewController.h"
#import "JTNavigationController.h"
#import <UIKit/UIKit.h>
#import "SWReleaseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWReleaseViewController *reVC = [[SWReleaseViewController alloc] init];
    UITabBarItem *fristItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    reVC.title = @"发布";
    reVC.tabBarItem = fristItem;
    JTNavigationController *fristNav = [[JTNavigationController alloc] initWithRootViewController:reVC];
//    BlackTableViewController *blackVC = [[BlackTableViewController alloc] init];
//    UITabBarItem *fristItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
//    blackVC.title = @"me";
//    blackVC.tabBarItem  = fristItem;
//    JTNavigationController *fristNav = [[JTNavigationController alloc] initWithRootViewController:blackVC];
    
    WhiteTableViewController *whiteVC = [[WhiteTableViewController alloc] init];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
    whiteVC.title = @"second";
    whiteVC.tabBarItem  = secondItem;
    JTNavigationController *secondNav = [[JTNavigationController alloc] initWithRootViewController:whiteVC];
    self.viewControllers = @[secondNav,fristNav];
    
    
//        self.myTabBarViewController = [[UITabBarController alloc] init];
//        blackVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"黑色心情" image:[UIImage imageNamed:@"settingBtn_Nav" ] tag:0];
//    
//        whiteVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发布心情" image:[UIImage imageNamed:@"settingBtn_Nav" ] tag:1];
//    
//        UIButton *button =  [[UIButton alloc] init];
//        button.imageView.image = [UIImage imageNamed:@"settingBtn_Nav"];
//        [button addTarget:self action:@selector(sendPost) forControlEvents:UIControlEventTouchUpInside];
//    
//        UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:blackVC];
//    
//        naVC.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:button];
//        naVC.title = @"Bad Mode";
//    
//    
//        NSArray *controllers = [NSArray arrayWithObjects:blackVC,whiteVC ,nil];
//        self.myTabBarViewController.viewControllers = controllers;
//        self.window.rootViewController = self.myTabBarViewController;
//        
//        [self.window addSubview:naVC.view];
    
    
    NSLog(@"Just Try!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
