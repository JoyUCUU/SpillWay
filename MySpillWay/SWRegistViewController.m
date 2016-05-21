

#import "SWRegistViewController.h"
#import "SWRegistUserViewController.h"
#import "WhiteTableViewController.h"
#import  "Bmob.h"
#import "SWChooseFormLoginViewController.h"
#import "SWReleaseViewController.h"
@interface SWRegistViewController ()
@property (weak, nonatomic) IBOutlet UIButton *registButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@property (weak, nonatomic) IBOutlet UIImageView *myAvatar;
@property (weak, nonatomic) IBOutlet UIButton *SMSCode;
@end

@implementation SWRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.registButton addTarget:self action:@selector(registor) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginButton  addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.SMSCode addTarget:self action:@selector(requestSms) forControlEvents:UIControlEventTouchUpInside];
    
    self.myAvatar.frame = CGRectMake(60,60, 40, 40);
    
    self.myAvatar.layer.masksToBounds =YES;
    
    self.myAvatar.layer.cornerRadius =50;
    
    [self.view addSubview:self.myAvatar];
   }
-(void)requestSms{
    
    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:self.userName.text andTemplate:@"test" resultBlock:^(int number, NSError *error) {
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registor{
//    SWRegistUserViewController *ruVC = [[SWRegistUserViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ruVC];
//    [self presentViewController:nav animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)login{

//    [self presentViewController:alertController animated:YES completion:nil];
    NSString  *myUsername = self.userName.text;
    NSString  *mypassword = self.passWord.text;
    if([myUsername isEqualToString:@""]){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if (![myUsername isEqualToString:@""] && [mypassword isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    [BmobUser loginInbackgroundWithMobilePhoneNumber:myUsername andSMSCode:mypassword block:^(BmobUser *user, NSError *error) {
        if (user) {
            NSLog(@"%@-----",user);
            WhiteTableViewController *wVC = [[WhiteTableViewController alloc] init];
            [self.navigationController pushViewController:wVC animated:NO];
//            wVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(releaseButton)];
            [self presentViewController:wVC animated:NO completion:nil];
            [self presentViewController:wVC animated:NO completion:^{
                wVC.navigationItem.rightBarButtonItem.title = @"发布";
            }];

            
        }else{
            NSLog(@"%@$$$$$$" ,error);
        }
    }];
    
}
//键盘回收
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
}
-(void)releaseButton{
        SWReleaseViewController *reVC = [[SWReleaseViewController alloc] init];
//    SWChooseFormLoginViewController *cfVC = [[SWChooseFormLoginViewController alloc] init];
    //    SWRegistViewController *regLog = [[SWRegistViewController alloc] init];
//    [self presentViewController:cfVC animated:YES completion:nil];
        [self.navigationController pushViewController:reVC animated:NO];
}

@end
