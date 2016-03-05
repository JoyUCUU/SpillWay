//
//  SWRegistUserViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 15/12/18.
//  Copyright © 2015年 JoyLiu. All rights reserved.
//
#import  "SWRegistUserViewController.h"
#import  "SWMainPageViewController.h"
#import  "ViewController.h"
#import  "Bmob.h"

@interface SWRegistUserViewController ()
@property (weak, nonatomic) IBOutlet UIButton *registButton;
@property (weak, nonatomic) IBOutlet UIButton *requestCheckCode;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *checkCode;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *checkPassword;
@end

@implementation SWRegistUserViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页面" image:[UIImage imageNamed:@"settingBtn_Nav"] tag:2];
    }
    return self;
}
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
    ViewController *mainVC = [[ViewController alloc] init];
    [self presentViewController:mainVC animated:NO completion:nil];
        BmobUser *buser = [[BmobUser alloc] init];
        buser.mobilePhoneNumber = self.phoneNumber.text;
        buser.password = self.password.text;
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
