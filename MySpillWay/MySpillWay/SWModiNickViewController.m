//
//  SWModiNickViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 16/5/7.
//  Copyright © 2016年 JoyLiu. All rights reserved.
//

#import "SWModiNickViewController.h"

@interface SWModiNickViewController ()

@end

@implementation SWModiNickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //标题
    self.navigationItem.title = @"修改昵称";
    //返回箭头的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //导航栏的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    //右按钮
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleBordered target:self action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem = myButton;
//    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightItemAction)];
//    self.navigationItem.rightBarButtonItem = right;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)rightItemAction{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
