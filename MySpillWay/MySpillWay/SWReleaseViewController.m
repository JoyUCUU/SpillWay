//
//  SWReleaseViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 16/5/6.
//  Copyright © 2016年 JoyLiu. All rights reserved.
//
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define StatusBarHeight (IOS7==YES ? 0 : 20)
#define BackHeight      (IOS7==YES ? 0 : 15)
#define fNavBarHeigth (IOS7==YES ? 64 : 44)
#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)
#import "SWReleaseViewController.h"
#import "ZXCollectionCell.h"
#import <objc/runtime.h>
#import  "Bmob.h"
#import "WhiteTableViewController.h"
#import "AppDelegate.h"
@interface SWReleaseViewController ()<ZXCollectionCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *clickButton;
@property(nonatomic,strong)NSMutableArray * imageArr;
@property(nonatomic,strong)NSMutableArray * imageArrPlaces;
@property(nonatomic,strong)NSMutableArray * imageArrPlacesURL;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *modeBt;
@property (weak, nonatomic) IBOutlet UIButton *healPictures;
@property (weak, nonatomic) IBOutlet UITextField *releaseText;
@property (assign, nonatomic) NSString *isGood;
@property (strong,nonatomic) NSString *dealID;
@property (strong ,nonatomic) NSString *ObjectIdString;
@property (strong ,nonatomic) BmobObject *myRelease;
@property (strong ,nonatomic) BmobObject *obj;
@property (strong ,nonatomic) NSString *pictureName;
@end

@implementation SWReleaseViewController
//unsigned int count = 0;
//Ivar *ivars = class_copyIvarList([UIAlertAction class], &count);
//for (int i = 0; i<count; i++) {
//    // 取出成员变量
//    Ivar ivar = *(ivars + i);
//    Ivar ivar = ivars[i];
//    // 打印成员变量名字
//    NSLog(@"%s------%s", ivar_getName(ivar),ivar_getTypeEncoding(ivar));
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.navigationItem.title = @"发布";
    //返回箭头的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //导航栏的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    //右按钮
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleBordered target:self action:@selector(finishAction)];
    self.navigationItem.rightBarButtonItem = myButton;
    [self.clickButton addTarget:self action:@selector(choosePictures) forControlEvents:UIControlEventTouchUpInside];
    [self.modeBt addTarget:self action:@selector(selectMode) forControlEvents:UIControlEventTouchUpInside];
    [self.healPictures addTarget:self action:@selector(dealwithPicture) forControlEvents:UIControlEventTouchUpInside];
      self.releaseText.delegate = self;
    [self loadData];
    [self drawUI];
}
-(void)selectMode{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *goodAction = [UIAlertAction actionWithTitle:@"好心情" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.isGood = @"0";
    }];
//    [goodAction setValue:[UIColor orangeColor] forKey:@"fontTextColor"];
    UIAlertAction *badAction = [UIAlertAction actionWithTitle:@"坏心情" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.isGood = @"1";
        
    }];
//    [badAction setValue:[UIColor grayColor] forKey:@"fontTextColor"];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.isGood = NULL;
        
    }];
    [alertController addAction:goodAction];
    [alertController addAction:badAction];
    [alertController addAction:cancle];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)dealwithPicture{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *dealpicture1 = [UIAlertAction actionWithTitle:@"模糊" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.dealID = @"0";
    }];
    //    [goodAction setValue:[UIColor orangeColor] forKey:@"fontTextColor"];
    UIAlertAction *dealpicture2 = [UIAlertAction actionWithTitle:@"碎片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.dealID = @"1";
    }];
    UIAlertAction *dealpicture3 = [UIAlertAction actionWithTitle:@"原图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.dealID = @"2";
    }];
    UIAlertAction *dealpicture4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.dealID = @"3";
    }];
    //    [badAction setValue:[UIColor grayColor] forKey:@"fontTextColor"];
    [alertController addAction:dealpicture1];
    [alertController addAction:dealpicture2];
    [alertController addAction:dealpicture3];
    [alertController addAction:dealpicture4];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
//当点击键盘上return按钮的时候调用
{
    //代理记录了当前正在工作的UITextField的实例，因此你点击哪个UITextField对象，形参就是哪个UITextField对象
    [textField resignFirstResponder];//键盘回收代码
    return YES;
}
-(void)loadData{
//    NSArray * arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    
    _imageArr = [NSMutableArray array];
    _imageArrPlaces = [NSMutableArray array];
//    for (int i=1; i<arr.count; i++) {
//        NSString * name = [NSString stringWithFormat:@"placehold1.png"];
//        UIImage * img = [UIImage imageNamed:name];
//        [_imageArr addObject:img];
//    }
    NSLog(@"%@",_imageArr);
}
-(void)drawUI{
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 350, fDeviceWidth,230) collectionViewLayout:flowLayout];

    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //注册cell和ReusableView（相当于头部）
    [self.collectionView registerClass:[ZXCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    
}
-(void)choosePictures{
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //        相机
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            [imgPicker setAllowsEditing:YES];
            [imgPicker setDelegate:self];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self presentViewController:imgPicker animated:YES completion:NULL];
            
        }];
        
        UIAlertAction *archiveAction2 = [UIAlertAction actionWithTitle:@"相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            [imgPicker setAllowsEditing:YES];
            [imgPicker setDelegate:self];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self presentViewController:imgPicker animated:YES completion:NULL];
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:archiveAction];
        [alertController addAction:archiveAction2];
        [self presentViewController:alertController animated:YES completion:nil];
}
-(void)moveImageBtnClick:(ZXCollectionCell *)aCell{
    NSIndexPath * indexPath = [self.collectionView indexPathForCell:aCell];
    NSLog(@"_____%ld",indexPath.row);
    [_imageArr removeObjectAtIndex:indexPath.row];
    [self.collectionView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UIActionSheet协议
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0)
    {
        //        相机
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        [imgPicker setAllowsEditing:YES];
        [imgPicker setDelegate:self];
        [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imgPicker animated:YES completion:NULL];
    }
    if (buttonIndex ==1) {
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        [imgPicker setAllowsEditing:YES];
        [imgPicker setDelegate:self];
        [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imgPicker animated:YES completion:NULL];
    }
}

//相机
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    static  int i = 0;
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    [self.imageArr addObject:image];
     self.pictureName = [self saveImage:image WithName:[NSString stringWithFormat:@"%d.png",i]];
    NSLog(@"%@",self.pictureName);
    [self.imageArrPlaces addObject:self.pictureName];
    NSLog(@"imageArrPlaces-------%@",self.imageArrPlaces[0]);
    i++;
//    saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.collectionView reloadData];
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    return;
}
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageArr.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    ZXCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    cell.imgView.image = [_imageArr objectAtIndex:indexPath.row];
    //    cell.text.text = [NSString stringWithFormat:@"Cell %ld",indexPath.row];
    cell.delegate = self;
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //边距占5*4=20 ，2个
    //图片为正方形，边长：(fDeviceWidth-20)/2-5-5 所以总高(fDeviceWidth-20)/2-5-5 +20+30+5+5 label高20 btn高30 边
    return CGSizeMake((fDeviceWidth-20)/3, (fDeviceWidth-20)/3);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}
//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //        UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //        cell.backgroundColor = [UIColor redColor];
    NSLog(@"选择%ld",indexPath.row);
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)finishAction{
    //上传图片
    self.imageArrPlacesURL = [NSMutableArray array];
    static int nindex = 1;
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *fileString1 = self.imageArrPlaces[0];
    NSString *fileString2 = self.imageArrPlaces[1];
    NSString *fileString3 = self.imageArrPlaces[2];
    NSString *fileString4 = self.imageArrPlaces[3];
    NSLog(@"fileString1??????-------%@",self.imageArrPlaces[0]);
    BmobObject *obj = [[BmobObject alloc] initWithClassName:@"releaseFile"];
    BmobFile *file = [[BmobFile alloc] init];
    [BmobFile filesUploadBatchWithPaths:@[fileString1,fileString2,fileString3,fileString4] progressBlock:^(int index, float progress) {
//         NSLog(@"self.ObjectIdString提交之后------%@",file.ObjectIdString);
//        NSLog(@"index %d progress %f",index,progress);
    } resultBlock:^(NSArray *array, BOOL isSuccessful, NSError *error) {
        
        for (int i = 0; i < array.count; i ++) {
            BmobFile *file = array[i];
            NSString *key = [NSString stringWithFormat:@"testFile%d",i];
            NSLog(@"filr.url-- %@",file.url);
       
            [self.imageArrPlacesURL addObject:file.url];

            [obj setObject:file forKey:key];
        }
        
        NSLog(@"NSMutableArray temp %@",self.imageArrPlacesURL);
        [obj saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            self.ObjectIdString = obj.objectId;
            NSLog(@"self.ObjectIdString提交之后------%@",obj.objectId);
            [self addRelation];
            [self saveURL];
            WhiteTableViewController *main = [[WhiteTableViewController alloc] init];
           [self.navigationController popToRootViewControllerAnimated:NO];
            
            
        }];
    }];
    nindex++;
   
    
    //上传数据
    BmobUser *bUser = [BmobUser getCurrentUser];
   self.myRelease = [BmobObject objectWithClassName:@"release"];
    [self.myRelease setObject:bUser forKey:@"userID"];
    [self.myRelease setObject:self.releaseText.text forKey:@"content"];
    [self.myRelease setObject:self.isGood forKey:@"mood"];
    [self.myRelease setObject:self.dealID forKey:@"pictureDeal"];

   
    [self.myRelease saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            NSLog(@"%@",self.myRelease.objectId);
           
        }else{
            if (error){
                NSLog(@"%@",error);
            }
    }
    }];
    
    
    
}
-(void)saveURL{
    NSArray *tempArray = [self.imageArrPlacesURL copy];
    BmobObject *test = [BmobObject objectWithoutDatatWithClassName:@"release" objectId:self.myRelease.objectId];
    [self.myRelease addObjectsFromArray:tempArray forKey:@"pictureUrl"];
    [self.myRelease updateInBackground];
}
-(void)addRelation{
    //获取要添加关联的release
    BmobObject *release1 = [BmobObject objectWithoutDatatWithClassName:@"release" objectId:self.myRelease.objectId];
    //新建relation对象
    BmobRelation *relation = [[BmobRelation alloc] init];
    [relation addObject:[BmobObject objectWithoutDatatWithClassName:@"releaseFile" objectId:self.ObjectIdString]];
    
    //添加关联到照片pictures中
    [release1 addRelation:relation forKey:@"pictures"];
    //异步更新obj的数据
    [release1 updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        
        if (isSuccessful) {
            NSLog(@"relation successful");
        }else{
            NSLog(@"relation error %@",[error description]);
        }
    }];
    

}
-(NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
       NSData* imageData = UIImagePNGRepresentation(tempImage);
       NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
       NSString* documentsDirectory = [paths objectAtIndex:0];
       // Now we get the full path to the file
       NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
       // and then we write it out
        [imageData writeToFile:fullPathToFile atomically:NO];
    
    return fullPathToFile;
}
#pragma mark 从文档目录下获取Documents路径
- (NSString *)documentFolderPath
{
      return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}
-(void)test{
    [self.navigationController popToRootViewControllerAnimated:NO];
    
}
@end
