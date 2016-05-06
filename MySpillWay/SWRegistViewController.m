

#import "SWRegistViewController.h"
#import "SWRegistUserViewController.h"
#import  "Bmob.h"
@interface SWRegistViewController ()
@property (weak, nonatomic) IBOutlet UIButton *registButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@property (weak, nonatomic) IBOutlet UIImageView *myAvatar;
@end

@implementation SWRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.registButton addTarget:self action:@selector(registor) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginButton  addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    

    
    self.myAvatar.frame = CGRectMake(60,60, 40, 40);
    
    self.myAvatar.layer.masksToBounds =YES;
    
    self.myAvatar.layer.cornerRadius =50;
    
    [self.view addSubview:self.myAvatar];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registor{
    SWRegistUserViewController *ruVC = [[SWRegistUserViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ruVC];
    [self presentViewController:nav animated:YES completion:nil];

    
}
-(void)login{
    NSString  *myUsername = self.userName.text;
    NSString  *mypassword = self.passWord.text;
//    [BmobUser loginInbackgroundWithMobilePhoneNumber:<#(NSString *)#> andSMSCode:<#(NSString *)#> block:<#^(BmobUser *user, NSError *error)block#>]
    
    
}


@end
