//
//  SWChooseFormLoginViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 16/5/6.
//  Copyright © 2016年 JoyLiu. All rights reserved.
//
#import "UMSocial.h"
#import "SWChooseFormLoginViewController.h"
#import "SWRegistViewController.h"
#import "SWRegistUserViewController.h"
@interface SWChooseFormLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *coImage1;
@property (weak, nonatomic) IBOutlet UIImageView *coImage2;
@property (weak, nonatomic) IBOutlet UIImageView *coImage3;
@property (weak, nonatomic) IBOutlet UIButton *coButton1;
@property (weak, nonatomic) IBOutlet UIButton *coButton2;
@property (weak, nonatomic) IBOutlet UIButton *coButton3;
@property (weak, nonatomic) IBOutlet UIButton *regist;
@property (weak, nonatomic) IBOutlet UIButton *mainButton;

@end

@implementation SWChooseFormLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeImageForm];
    [self.coButton1 addTarget:self action:@selector(phoneLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.regist addTarget:self action:@selector(registUser) forControlEvents:UIControlEventTouchUpInside];
    [self.coButton2 addTarget:self action:@selector(weixinLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.coButton3 addTarget:self action:@selector(QQLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.mainButton addTarget:self action:@selector(returnMain) forControlEvents:UIControlEventTouchUpInside];
}
-(void)returnMain{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)QQLogin{
   // UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
 //   snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
     //   if (response.responseCode == UMSResponseCodeSuccess) {
            
       //     UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            
         //   NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        //}});
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
}
-(void)weixinLogin{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }
        
    });
}
-(void)phoneLogin{
    SWRegistViewController *rVC = [[SWRegistViewController alloc] init];
    [self presentViewController:rVC animated:YES completion:nil];
}
-(void)registUser{
    SWRegistUserViewController *ruVC = [[SWRegistUserViewController alloc] init];
    [self presentViewController:ruVC animated:YES completion:nil];
}
-(void)changeImageForm{
    [self TellmtImage:self.coImage1];
    [self TellmtImage:self.coImage2];
    [self TellmtImage:self.coImage3];
}
-(void)TellmtImage:(UIImageView *) image{
    image.frame = CGRectMake(60,100, 60, 60);
    
    image.layer.masksToBounds =YES;
    
    image.layer.cornerRadius =36.5;
    
    [self.view addSubview:image];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
