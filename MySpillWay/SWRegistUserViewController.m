//
//  SWRegistUserViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 15/12/18.
//  Copyright © 2015年 JoyLiu. All rights reserved.
//

#import "SWRegistUserViewController.h"
#import "MHGlobalFunction.h"


@interface SWRegistUserViewController ()
@property (weak, nonatomic) IBOutlet UIButton *registButton;

@end

@implementation SWRegistUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationItem];
    
//    [_registButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initNavigationItem{
    self.title = @"注册";
//    UIButton *leftButton = [MHGlobalFunction getIconFontBarButtonItem:@"取消" rect:CGRectMake(0, 0, 32, 30) size:kBackButtonFontSize];
    UIButton *leftButton = [[UIButton alloc] init];
    [leftButton addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}
-(void)cancle{
    [self.navigationController popoverPresentationController];
}
@end
