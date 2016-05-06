//
//  SWChooseFormLoginViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 16/5/6.
//  Copyright © 2016年 JoyLiu. All rights reserved.
//

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

@end

@implementation SWChooseFormLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeImageForm];
    [self.coButton1 addTarget:self action:@selector(phoneLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.regist addTarget:self action:@selector(registUser) forControlEvents:UIControlEventTouchUpInside];
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
