//
//  SWRegistUserViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 15/12/18.
//  Copyright © 2015年 JoyLiu. All rights reserved.
//
#import  "BmobSDK/Bmob.h"
#import "SWRegistUserViewController.h"
#import "MHGlobalFunction.h"
#import "SWMainPageViewController.h"


@interface SWRegistUserViewController ()
@property (weak, nonatomic) IBOutlet UIButton *registButton;
@property (weak, nonatomic) IBOutlet UIButton *requestCheckCode;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *checkCode;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *checkPassword;
@end

@implementation SWRegistUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationItem];
    
    [self.registButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [_requestCheckCode addTarget:self action:@selector(requestCheckCoder) forControlEvents:UIControlEventTouchUpInside];
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
-(void)regist{
    SWMainPageViewController *mpVC = [[SWMainPageViewController alloc] init];
    [self presentViewController:mpVC animated:NO completion:nil];
        BmobUser *buser = [[BmobUser alloc] init];
        buser.mobilePhoneNumber = self.phoneNumber.text;
        buser.password = self.password.text;
    //    buser.email = @"xxx@gmail.com";
        [buser signUpOrLoginInbackgroundWithSMSCode:self.checkCode.text block:^(BOOL isSuccessful, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            } else {
                BmobUser *user = [BmobUser getCurrentUser];
                NSLog(@"%@",[BmobUser getCurrentUser]);

                
            }
        }];
    
}
-(void)requestCheckCoder{

    NSString *number = self.phoneNumber.text;
    NSLog(@"%@",number);
    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:self.phoneNumber.text andTemplate:@"test" resultBlock:^(int number, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            //获得smsID
            NSLog(@"sms ID：%d",number);
            [BmobSMS querySMSCodeStateInBackgroundWithSMSId:number resultBlock:^(NSDictionary *dic, NSError *error) {
                if (dic) {
                    NSLog(@"%@",dic);
                } else {
                    NSLog(@"%@",error);
                }
            }];
        }
    }];
   
}
@end
