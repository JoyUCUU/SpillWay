//
//  MHGlobalFunction.h
//  vomoho
//
//  Created by AloesLu on 15/9/23.
//  Copyright © 2015年 AloesLu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MJRefreshStateHeader.h"



@class MHBaseViewController,MHTagInfo;

typedef NS_ENUM(NSInteger, MHInfoType) {
    MHInfoNone = 0,
    MHInfoNew = 1,
    MHInfoPost = 2,
    MHInfoActivity = 3,
    MHInfoAd = 4,
    MHInfoScene = 5
};

@interface MHGlobalFunction : NSObject

/*
 * 方法说明：功能说明（使用iconfont字体格式创建UIButton）
 * 修改记录：（）
 */
+ (UIButton *)getIconFontBarButtonItem:(NSString *)title rect:(CGRect)rect size:(CGFloat)size;
+ (UIButton *)getIconImageButton:(NSString *)title size:(CGFloat)size btn:(UIButton*)button;
+ (UIButton *)getNavBarButtonItem:(NSString *)title;
+ (void)setGenderAndAgeButton:(NSString *)title btn:(UIButton*)button gender:(NSNumber *)gender;
/**
 *  标签定义
 *
 *  @param tagInfo 标签信息
 */
+ (void)setPersonTagLabel:(UILabel*)label tagInfo:(MHTagInfo *)tagInfo;

/*
 * 方法说明：功能说明（刷新tableView的其中一个section或一个cell）
 * 修改记录：（）
 */
+ (void)refreshTableView:(UITableView *)tableview byRow:(int)row bySection:(int)section;
+ (void)refreshTableView:(UITableView *)tableview bySection:(int)section;

/*
 * 方法说明：功能说明（存储或读取NSUserDefaults中的照片信息）
 * 修改记录：（）
 */
+(NSMutableArray *)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName;
+(void)writeArrayWithCustomObjToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray;

/*
 * 方法说明：功能说明（设置五个模块的左头像）
 * 修改记录：（）
 */
+ (void)setLeftAvatarImageNavItem:(MHBaseViewController *)selfVC;

/*
 * 方法说明：功能说明（获取UUID）
 * 修改记录：（）
 */

+ (NSString *)uuidString;

/*
 *方法说明：功能说明（照片预览）
 *修改记录：（）
 */
+(void)lookUpPicture:(NSMutableDictionary *)imageViewsDict index:(NSInteger)index;
//本地图片预览
+(void)lookUpSelfPicture:(NSMutableDictionary *)imageViewsDict index:(NSInteger)index;

/*
 *方法说明：功能说明（临时数据暂存、获取、删除）
 *修改记录：（）
 */
+ (void)saveSendData:(id)data pathName:(NSString *)pathName;
+ (void)deleteSendData:(NSString *)pathName;
+ (id)loadSendData:(NSString *)pathName;

///*
// *方法说明：功能说明（获取gif刷新头）
// *修改记录：（）
// */
//+ (MJRefreshGifHeader *)getMJRefreshGifHeader;
//
///*
// *方法说明：功能说明（MBProgressHUD提示）
// *修改记录：（）
// */
//+(void)showHUD:(NSString *)text;
//+(void)showHUDProgress:(NSString *)text andHUD:(MBProgressHUD *)hud;
//+(void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud andMode:(NSString *)mode;
//+(void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud;

/*
 *方法说明：功能说明（图片缩略url处理）
 *修改记录：（）
 */
//width(指定目标缩略图的宽度或高度)
//isDeal(目标缩略图大于原图是否处理。如果值是1, 即不处理，是0，表示处理)
//firstReason(缩放优先边， 默认值：0：长边（默认值)   缩放优先边，如果是强制缩略，值是:2)
//isCut(是否进行裁剪。如果是想对图进行自动裁剪，必须指定为1)
+(NSURL *)imageHandleOneSide:(NSString *)url width:(NSString *)width height:(NSString *)height isDeal:(NSString *)isDeal;
+(NSURL *)imageHandleTwoSide:(NSString *)url width:(NSString *)width height:(NSString *)height firstReason:(NSString *)firstReason isDeal:(NSString *)isDeal;
+(NSURL *)imageHandleTwoSide:(NSString *)url width:(NSString *)width height:(NSString *)height firstReason:(NSString *)firstReason  isCut:(NSString *)isCut isDeal:(NSString *)isDeal;
+(NSURL *)imageAvatar40HandleTwoSide:(NSString *)url;
+(NSURL *)imageAvatar25HandleTwoSide:(NSString *)url;
+(NSURL *)imageOriginHandleTwoSide:(NSString *)url;
+(NSURL *)imagePostHandleTwoSide:(NSString *)url;
//清理图片缓存
+(NSUInteger)getPictureCache;
+(void)clearPictureCache;

//对TextField和TextView进行字数判断
+(void)judgeNumTextField:(UITextField *)textField maxLenght:(int)maxLenght showText:(NSString *)showText;
+(void)judgeNumTextView:(UITextView *)textView maxLenght:(int)maxLenght showText:(NSString *)showText;

//文本处理（行间距，段间距）
+ (NSMutableParagraphStyle *)getContentAttributed:(NSString *)text;
+ (CGSize)getContentSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size text:(NSString *)text;

//获取自身需要的时间显示格式
+ (NSString *)getActivityDefineTime:(NSString *)time;
@end
