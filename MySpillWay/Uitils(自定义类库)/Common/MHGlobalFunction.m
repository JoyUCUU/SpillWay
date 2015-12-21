//
//  MHGlobalFunction.m
//  vomoho
//
//  Created by AloesLu on 15/9/23.
//  Copyright © 2015年 AloesLu. All rights reserved.
//

#import "MHGlobalFunction.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"
//#import "MHActivity.h"
//#import "MHPost.h"
@implementation MHGlobalFunction

+(void)lookUpPicture:(NSMutableDictionary *)imageViewsDict index:(NSInteger)index
{
    //当点击到装有图片的ccell之时，初始化一个数组，将每一个帖子里面的图片封装到MJPhoto对象当中
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < [imageViewsDict count]; i++) {
        //首先要读物照片
        MJPhoto *photo = [[MJPhoto alloc] init];
        //找到对应的imageView
//        photo.srcImageView = [imageViewsDict objectForKey:[NSNumber numberWithInt:i]]; // 来源于哪个UIImageView
//        photo.image = photo.srcImageView.image; // 图片路径
        photo.url=[imageViewsDict objectForKey:[NSNumber numberWithInt:i]];
        [photos addObject:photo];
    }
    NSLog(@"photo %@",photos);
    // 2.显示相册
    //这里使用MJPhotoBrowser来显示被选中的图片，点击一下就会弹出这个图片
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = index; // 弹出相册时显示的第一张图片是？
    browser.photos = photos; // 设置所有的图片
    browser.showSaveBtn = NO;
    [browser show];
}

+(void)lookUpSelfPicture:(NSMutableDictionary *)imageViewsDict index:(NSInteger)index
{
    //当点击到装有图片的ccell之时，初始化一个数组，将每一个帖子里面的图片封装到MJPhoto对象当中
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < [imageViewsDict count]; i++) {
        //首先要读物照片
        MJPhoto *photo = [[MJPhoto alloc] init];
        //找到对应的imageView
        photo.srcImageView = [imageViewsDict objectForKey:[NSNumber numberWithInt:i]]; // 来源于哪个UIImageView
        photo.image = photo.srcImageView.image; // 图片路径
//        photo.url=[imageViewsDict objectForKey:[NSNumber numberWithInt:i]];
        [photos addObject:photo];
    }
    NSLog(@"photo %@",photos);
    // 2.显示相册
    //这里使用MJPhotoBrowser来显示被选中的图片，点击一下就会弹出这个图片
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = index; // 弹出相册时显示的第一张图片是？
    browser.photos = photos; // 设置所有的图片
    browser.showSaveBtn = NO;
    [browser show];
}

//+ (UIButton *)getIconFontBarButtonItem:(NSString *)title rect:(CGRect)rect size:(CGFloat)size{
//    UIFont *iconfont=[UIFont fontWithName:@"iconfont" size:size];
//    UIButton *button=[[UIButton alloc]initWithFrame:rect];
//    [button setTitle:title forState:UIControlStateNormal];
//    [button.titleLabel setFont:iconfont];
//    [button setBackgroundColor:[UIColor clearColor]];
//    [button setTitleColor:kMainColor forState:UIControlStateNormal];
//    [button setTitleColor:kMainColorPress forState:UIControlStateHighlighted];
//    return button;
//}
//
//+ (UIButton *)getIconImageButton:(NSString *)title size:(CGFloat)size btn:(UIButton*)button{
//    UIFont *iconfont=[UIFont fontWithName:@"iconfont" size:size];
//    [button setTitle:title forState:UIControlStateNormal];
//    [button.titleLabel setFont:iconfont];
//    [button setBackgroundColor:[UIColor clearColor]];
//    [button setTitleColor:kDescribeColor forState:UIControlStateNormal];
//    return button;
//}

+ (void)setGenderAndAgeButton:(NSString *)title btn:(UIButton*)button gender:(NSNumber *)gender{
    UIFont *iconfont=[UIFont fontWithName:@"iconfont" size:12];
    NSString *str=@"";
    [button.titleLabel setFont:iconfont];
    if([gender intValue]==2){
        str= [NSString stringWithFormat:@"\U0000e654 %@",title];
        [button setBackgroundColor:[UIColor colorWithRed:248/255.0 green:128/255.0 blue:171/255.0 alpha:1.0]];
    }else if([gender intValue]==1){
        str= [NSString stringWithFormat:@"\U0000e653 %@",title];
        [button setBackgroundColor:[UIColor colorWithRed:128/255.0 green:192/255.0 blue:248/255.0 alpha:1.0]];
    }else{
        str= [NSString stringWithFormat:@"\U0000e65e %@",title];
        [button setBackgroundColor:[UIColor colorWithRed:194/255.0 green:194/255.0 blue:194/255.0 alpha:1.0]];
    }
    [button setTitle:str forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
//
//+ (void)setPersonTagLabel:(UILabel*)label tagInfo:(MHTagInfo *)tagInfo{
//    label.text=[NSString stringWithFormat:@"%@    ", tagInfo.name];
//    label.backgroundColor=[UIColor colorWithHexString:tagInfo.color andAlpha:1.0];
//}

+ (UIButton *)getNavBarButtonItem:(NSString *)title{
    UIFont *iconfont=[UIFont fontWithName:@"iconfont" size:25];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:iconfont];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    return button;
}

+ (void)refreshTableView:(UITableView *)tableview byRow:(int)row bySection:(int)section{
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:row inSection:section];
    [tableview reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

+ (void)refreshTableView:(UITableView *)tableview bySection:(int)section{
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
    [tableview reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

}

+ (NSMutableArray *)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:keyName];
    NSMutableArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return myArray;
}
+ (void)writeArrayWithCustomObjToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myArray];
    [defaults setObject:data forKey:keyName];
    [defaults synchronize];
}

//+ (void)setLeftAvatarImageNavItem:(MHBaseViewController *)selfVC{
//    
//    if(![[ALBBOpenAccountSession sharedInstance] isLogin]){
//        //设置导航栏左边按钮
////        [selfVC.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"me_normal"] style:UIBarButtonItemStylePlain target:selfVC action:@selector(loginOrMineinfo)] animated:NO];
//        UIButton *button=[MHGlobalFunction getIconFontBarButtonItem:@"登录" rect:CGRectMake(0, 0, 30, 40) size:15];
//        [button addTarget:selfVC action:@selector(loginOrMineinfo) forControlEvents:UIControlEventTouchUpInside];
//        selfVC.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];
//    }else{
//        UITapImageView *avatarImage=[[UITapImageView alloc]initWithFrame:CGRectMake(0, 0, kAvatar25, kAvatar25)];
//        avatarImage.image=[UIImage imageNamed:@"iconDefault"];
//        avatarImage.layer.masksToBounds=YES;
//        avatarImage.layer.cornerRadius=kAvatar25/2;
//        [avatarImage setImageWithUrl:[MHGlobalFunction imageAvatar40HandleTwoSide:[[MHUserManager sharedManager] getkUserDefaults_Avatar]] placeholderImage:[UIImage imageNamed:@"iconDefault"] tapBlock:^(id obj) {
//            [selfVC loginOrMineinfo];
//        }];
//        [selfVC.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:avatarImage]];
//    }
//}

+ (NSString *)uuidString {
    NSString *uuidString = [[NSUUID UUID] UUIDString];
    return uuidString;
}

+ (NSString *)toJson:(NSMutableArray *)array{
    NSString *str=@"[";
    for(int i=0;i<array.count-1;i++){
        NSString *ss=[array objectAtIndex:i];
        str=[str stringByAppendingString:@"\""];
        str=[str stringByAppendingString:ss];
        str=[str stringByAppendingString:@"\""];
        str=[str stringByAppendingString:@","];
    }
    if(array.count>0){
        NSString *ss=[array objectAtIndex:array.count-1];
        str=[str stringByAppendingString:@"\""];
        str=[str stringByAppendingString:ss];
        str=[str stringByAppendingString:@"\""];
    }
    return [str stringByAppendingString:@"]"];
}

//+ (void)saveSendData:(id)data pathName:(NSString *)pathName{
//    NSString *dataPath = [NSString stringWithFormat:@"%@%@", [[MHUserManager sharedManager] getkUserDefaults_userId],pathName];
//    NSMutableDictionary *tweetImagesDict = [NSMutableDictionary new];
//    NSMutableArray *imageDict=[NSMutableArray arrayWithCapacity:1];
//    if([pathName isEqualToString:@"_postForSend"]){
//        MHPost *post=data;
//        [NSObject saveResponseData:@{@"title" : post.title? post.title: @"",
//                                     @"content" : post.content? post.content : @""                                     } toPath:dataPath];
//    }else if([pathName isEqualToString:@"_activityForSend"]){
//        MHActivity *activity=data;
//        imageDict=activity.picList;
//        [NSObject saveResponseData:@{@"title" : activity.title? activity.title: @"",
//                                     @"content" : activity.content? activity.content : @"",
//                                     @"startTime" : activity.startTime? activity.startTime : @"",
//                                     @"endTime" : activity.endTime? activity.endTime : @"",
//                                     @"sighupTime" : activity.sighupTime? activity.sighupTime : @"",
//                                     @"address" : activity.address? activity.address : @"",
//                                     @"cost" : activity.cost? activity.cost : @"",
//                                     @"memberNumLimit" : activity.memberNumLimit? activity.memberNumLimit : @"",
//                                     @"isPhone" : activity.isPhone? activity.isPhone : @"",
//                                     @"type" : activity.type? activity.type : @"",
//                                     @"typeCode" : activity.typeCode? activity.typeCode : @"",} toPath:dataPath];
//    }
//}

//+ (id)loadSendData:(NSString *)pathName{
//    NSString *dataPath = [NSString stringWithFormat:@"%@%@", [[MHUserManager sharedManager] getkUserDefaults_userId],pathName];
//    
//    NSDictionary *contentDict = [NSObject loadResponseWithPath:dataPath];
//    if([pathName isEqualToString:@"_postForSend"]){
//        MHPost *post=[[MHPost alloc]init];
//        post.title=[contentDict objectForKey:@"title"];
//        post.content=[contentDict objectForKey:@"content"];
//        return post;
//    }else if([pathName isEqualToString:@"_activityForSend"]){
//        MHActivity *activity=[[MHActivity alloc]init];
//        activity.title=[contentDict objectForKey:@"title"];
//        activity.startTime=[contentDict objectForKey:@"startTime"];
//        activity.endTime=[contentDict objectForKey:@"endTime"];
//        activity.sighupTime=[contentDict objectForKey:@"sighupTime"];
//        activity.address=[contentDict objectForKey:@"address"];
//        activity.content=[contentDict objectForKey:@"content"];
//        activity.cost=[contentDict objectForKey:@"cost"];
//        activity.memberNumLimit=[contentDict objectForKey:@"memberNumLimit"];
//        activity.isPhone=[contentDict objectForKey:@"isPhone"];
//        activity.type=[contentDict objectForKey:@"type"];
//        activity.typeCode=[contentDict objectForKey:@"typeCode"];
//        return activity;
//    }
//    return nil;
//}

//+ (void)deleteSendData:(NSString *)pathName{
//     NSString *dataPath = [NSString stringWithFormat:@"%@%@", [[MHUserManager sharedManager] getkUserDefaults_userId],pathName];
//    [NSObject deleteImageCacheInFolder:dataPath];
//    [NSObject deleteResponseCacheForPath:dataPath];
//}
//
//+ (MJRefreshGifHeader *)getMJRefreshGifHeader{
//    UIImage *image=[UIImage imageNamed:@"me_normal"];
//    NSArray *arry=@[image,image];
//    
//    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(selector)];
//    [header setImages:arry duration:2.0 forState:MJRefreshStateIdle];
//    header.stateLabel.hidden=YES;
//    header.lastUpdatedTimeLabel.hidden=YES;
//    return header;
//}

//+ (void)showHUD:(NSString *)text{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
//    hud.mode = MBProgressHUDModeText;
//    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
//    hud.detailsLabelText = text;
//    hud.margin = 10.f;
//    hud.removeFromSuperViewOnHide = YES;
//    [hud hide:YES afterDelay:1.0];
//}
//+ (void)showHUDProgress:(NSString *)text andHUD:(MBProgressHUD *)hud{
//    hud.mode = MBProgressHUDModeText;
//    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
//    hud.detailsLabelText = text;
//    hud.margin = 10.f;
//    [hud hide:YES afterDelay:6.0];
//}
//
//+ (void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud andMode:(NSString *)mode{
//    [view addSubview:hud];
//    hud.labelText = text;
//    hud.square = YES;
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:mode]];
//    [hud show:YES];
//    [hud hide:YES afterDelay:2];
//}
//+ (void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud
//{
//    [view addSubview:hud];
//    hud.labelText = text;//显示提示
//    //hud.dimBackground = YES;//使背景成黑灰色，让MBProgressHUD成高亮显示
//    hud.square = YES;//设置显示框的高度和宽度一样
//    [hud show:YES];
//    [hud hide:YES afterDelay:10];
//}

+ (NSURL *)imageHandleOneSide:(NSString *)url width:(NSString *)width height:(NSString *)height  isDeal:(NSString *)isDeal{
    if(width){
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@@%@w_%@l",url,width,isDeal]];
    }
    if(height){
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@@%@h_%@l",url,width,isDeal]];
    }
    return [NSURL URLWithString:url];
}
+ (NSURL *)imageHandleTwoSide:(NSString *)url width:(NSString *)width height:(NSString *)height firstReason:(NSString *)firstReason isCut:(NSString *)isCut isDeal:(NSString *)isDeal{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@@%@w_%@h_%@e_%@c_%@l",url,width,height,firstReason,isCut,isDeal]];
}
+ (NSURL *)imageHandleTwoSide:(NSString *)url width:(NSString *)width height:(NSString *)height firstReason:(NSString *)firstReason isDeal:(NSString *)isDeal{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@@%@w_%@h_%@e_%@l",url,width,height,firstReason,isDeal]];
}
+ (NSURL *)imageAvatar40HandleTwoSide:(NSString *)url{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@@100w_100h_1e_1c_50-2ci",url]];
}
+ (NSURL *)imageAvatar25HandleTwoSide:(NSString *)url{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@@60w_60h_1e_1c_30-2ci",url]];
}
+ (NSURL *)imageOriginHandleTwoSide:(NSString *)url{
    return [NSURL URLWithString:url];
}
+(NSURL *)imagePostHandleTwoSide:(NSString *)url{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@@120w_120h_1e_1l",url]];
}

//+(NSUInteger)getPictureCache{
//  return  [[SDImageCache sharedImageCache] getSize];
//}
//+ (void)clearPictureCache{
//    [[SDImageCache sharedImageCache] clearDisk];
//   [[SDImageCache sharedImageCache] clearMemory];//可有可无
//    NSLog(@"clear disk");
//}
//
//+ (void)judgeNumTextField:(UITextField *)textField maxLenght:(int)maxLenght showText:(NSString *)showText{
//    NSString *toBeString = textField.text;
//    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
//    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
//        UITextRange *selectedRange = [textField markedTextRange];
//        //获取高亮部分
//        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
//        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
//        if (!position) {
//            if (toBeString.length >= maxLenght) {
//                textField.text = [toBeString substringToIndex:maxLenght];
//                [kKeyWindow showStatusBarSuccessStr:showText];
//            }
//        }
//        // 有高亮选择的字符串，则暂不对文字进行统计和限制
//        else{
//            
//        }
//    }
//    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
//    else{
//        if (toBeString.length >= maxLenght) {
//            [kKeyWindow showStatusBarSuccessStr:showText];
//            textField.text = [toBeString substringToIndex:maxLenght];
//        }
//    }
//}
//+ (void)judgeNumTextView:(UITextView *)textView maxLenght:(int)maxLenght showText:(NSString *)showText{
//    NSString *toBeString = textView.text;
//    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
//    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
//        UITextRange *selectedRange = [textView markedTextRange];
//        //获取高亮部分
//        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
//        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
//        if (!position) {
//            if (toBeString.length >= maxLenght) {
//                textView.text = [toBeString substringToIndex:maxLenght];
//                [kKeyWindow showStatusBarSuccessStr:showText];
//            }
//        }
//        // 有高亮选择的字符串，则暂不对文字进行统计和限制
//        else{
//            
//        }
//    }
//    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
//    else{
//        if (toBeString.length >= maxLenght) {
//            [kKeyWindow showStatusBarSuccessStr:showText];
//            textView.text = [toBeString substringToIndex:maxLenght];
//        }
//    }
//
//}

+ (NSMutableParagraphStyle *)getContentAttributed:(NSString *)text{
//    创建NSMutableParagraphStyle实例
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//    设置行距
    [paragraphStyle setLineSpacing:6.0f];
//    设置段间距
    [paragraphStyle setParagraphSpacing:12];
//    设置左对齐
    paragraphStyle.alignment = NSTextAlignmentLeft;
//    [paragraphStyle setFirstLineHeadIndent:30];
    return paragraphStyle;
}

+ (CGSize)getContentSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size text:(NSString *)text{
    CGSize resultSize = CGSizeZero;
    if (text.length <= 0) {
        return resultSize;
    }
    NSMutableParagraphStyle *paragraphStyle=[self getContentAttributed:text];
    resultSize = [text boundingRectWithSize:size
                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                 attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle}
                                    context:nil].size;
    return resultSize;
}

//+ (NSString *)getActivityDefineTime:(NSString *)time{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
//    NSDate *timeData = [dateFormatter dateFromString:time];
//    
//    int dayNum = [timeData firstWeekDayInMonth] + [timeData day];
//    return [NSString stringWithFormat:@"%d月%@ (%@) %lu:%@", [timeData month], [self dealWithNum:[timeData day]], [self getCharWeekFromNo:dayNum], [timeData hour], [self dealWithNum:[timeData minute]]];
//}
//+ (NSString *)dealWithNum:(unsigned long)num{
//    if(num<10){
//        return [NSString stringWithFormat:@"0%lu",num];
//    }else{
//        return [NSString stringWithFormat:@"%lu",num];
//    }
//}
//+ (NSString *)getCharWeekFromNo:(int)number {
//    number = number % 7;
//    NSArray *weekArray = @[@"周六",@"周日",@"周一",@"周二",@"周三",@"周四",@"周五"];
//    return weekArray[number];
//}

@end
