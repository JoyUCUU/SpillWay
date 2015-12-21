//
//  Coding_NetAPIManager.h
//  Coding_iOS
//
//  Created by 王 原闯 on 14-7-30.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "CodingNetAPIClient.h"
@class MHUser,MHPost,MHActivity,MHReply,MHTip;
@interface MH_NetAPIManager : NSObject
+ (instancetype)sharedManager;

/*
 *用户
 */
//请求提交==register
- (void)request_Register_WithToken:(NSString *)token thirdToken:(NSString *)thirdToken andBlock:(void (^)(id data, NSError *error))block;
//请求提交==更新用户信息
- (void)request_UpdateUser_WithUser:(MHUser *)user andBlock:(void (^)(id data, NSError *error))block;
//请求获取==用户个人信息
- (void)request_GetUserInfo_WithUserId:(NSString *)userId queryer:(NSString *)queryer andBlock:(void (^)(id data, NSError *error))block;
//用户绑定手机或者修改手机号码发送短信验证码
- (void)request_SendNote_WithUserId:(NSString *)uid phone:(NSString *)phone andBlock:(void (^)(id data, NSError *error))block;
//用户绑定手机号码及密码
- (void)request_savePhoneAndPassword_WithUserId:(NSString *)uid phone:(NSString *)phone password:(NSString*)password varCode:(NSString*)verCode andBlock:(void (^)(id data, NSError *error))block;
//用户重新绑定手机接口
- (void)request_updateUserPhone_WithUserId:(NSString *)uid phone:(NSString *)phone password:(NSString*)password varCode:(NSString*)verCode andBlock:(void (^)(id data, NSError *error))block;
//获取用户个人动态
- (void)request_GetUserDynamicInfo_WithUserId:(NSString *)uid dynamicUid:(NSString *)dynamicUid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;

/*
 *头条
 */
//请求获取==头条--Headline
- (void)request_Headline_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==资讯详情--NewsDetail
- (void)request_NewsDetail_WithUserId:(NSString *)userId infoId:(NSString *)infoId andBlock:(void (^)(id, NSError *))block;
//请求获取==广告--Ad
- (void)request_Ad_WithUserId:(NSString *)userId aid:(NSString *)aid andBlock:(void (^)(id, NSError *))block;
//请求获取==启动页广告--Ad
- (void)request_Launchad_WithUserId:(NSString *)userId andBlock:(void (^)(id, NSError *))block;

/*
 *圈子
 */
//请求获取==板块列表--GroupList
- (void)request_GroupList_WithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;
//请求获取==板块详情--GroupDetail
- (void)request_GroupDetail_WithUserId:(NSString *)userId gid:(NSNumber *)gid andBlock:(void (^)(id data, NSError *error))block;
//请求获取==圈子类型
- (void)request_GetGroupType_WithUserId:(NSString *)uid andBlock:(void (^)(id data, NSError *error))block;
//请求获取==关注板块或取消关注
- (void)request_FollowGroup_WithUserId:(NSString *)uid gid:(NSNumber *)gid ifFollow:(NSNumber *)ifFollow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==帖子列表--PostList
- (void)request_PostList_WithGid:(NSNumber *)gid fromId:(NSString *)fromId userId:(NSString *)userId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==我的帖子列表--PostList
- (void)request_PostOtherList_WithGid:(NSNumber *)gid fromId:(NSString *)fromId userId:(NSString *)userId pageSize:(NSString *)pageSize ownerUserId:(NSString *)ownerUserId pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==帖子详情--PostDetail
- (void)request_PostDetail_WithPid:(NSString *)pid uid:(NSString *)uid andBlock:(void (^)(id data, NSError *error))block;
//请求提交==创建或修改帖子
- (void)request_SavePost_WithPost:(MHPost *)post andBlock:(void (^)(id data, NSError *error))block;
//请求提交==获取资讯列表
- (void)request_NewsList_WithUserId:(NSString *)uid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求提交==获取资讯条数和logoUrl
- (void)request_UnReadNewsCount_WithUserId:(NSString *)uid andBlock:(void (^)(id data, NSError *error))block;
//请删除帖子
- (void)request_DeletePost_WithPid:(NSString *)pid uid:(NSString *)uid andBlock:(void (^)(id data, NSError *error))block;

/*
 *玩乐
 */
//请求获取==精选活动列表
- (void)request_SelectActions_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==所有活动列表
- (void)request_AllActions_WithUserId:(NSString *)userId fromId:(NSString *)fromId typeCode:(NSString*)typeCode outAid:(NSString *)outAid isOwner:(NSString *)isOwner pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求提交==保存或修改活动
- (void)request_SaveOrUpdateAction_WithActivity:(MHActivity *)activity andBlock:(void (^)(id data, NSError *error))block;
//请求获取==活动类型
- (void)request_GetActionType_WithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;
//请求获取==活动详情
- (void)request_GetActionById_WithUserId:(NSString *)userId aid:(NSString *)aid andBlock:(void (^)(id data, NSError *error))block;
//请求获取==活动报名人员列表
- (void)request_GetActionMembers_WithUserId:(NSString *)userId aid:(NSString *)aid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求提交==活动报名
- (void)request_ApplyAction_WithUserId:(NSString *)userId aid:(NSString *)aid realname:(NSString *)realname phone:(NSString *)phone stat:(NSNumber *)stat andBlock:(void (^)(id data, NSError *error))block;
//请求获取==我参加的活动
- (void)request_JoinActionList_WithUserId:(NSString *)uid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;

/*
 *评论
 */
//请求获取==帖子或者资讯的评论
- (void)request_ReplyList_WithType:(NSNumber *)type infoId:(NSString *)infoId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==某个资讯或帖子的评论数
- (void)request_ReplyNum_WithType:(NSNumber *)type infoId:(NSString *)infoId andBlock:(void (^)(id data, NSError *error))block;
//请求提交==添加、修改评论
- (void)request_SaveReply_WithReply:(MHReply *)reply andBlock:(void (^)(id data, NSError *error))block;
//请求提交==删除评论
- (void)request_DelReply_WithRid:(NSString *)rid type:(NSNumber *)type infoId:(NSString *)infoId andBlock:(void (^)(id data, NSError *error))block;

/*
 *赞
 */
//请求提交==点赞
- (void)request_AddPraise_WithUserId:(NSString *)userId type:(NSNumber *)type infoId:(NSString *)infoId stat:(NSNumber *)stat andBlock:(void (^)(id data, NSError *error))block;
//请求获取==取消点赞
//-(void)request_RemovePraise_WithUserId:(NSString *)userId faId:(NSString *)faId andBlock:(void (^)(id data, NSError *error))block;
//请求获取==点赞列表
- (void)request_GetPraiseList_WithUserId:(NSString *)userId type:(NSNumber *)type infoId:(NSString *)infoId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow softNum:(NSString *)softNum andBlock:(void (^)(id data, NSError *error))block;


/*
 * 收藏
 */
//请求提交==添加收藏
- (void)request_SaveOrUpdateFavorite_WithUserId:(NSString *)userId type:(NSNumber *)type infoId:(NSString *)infoId stat:(NSNumber *)stat andBlock:(void (^)(id data, NSError *error))block;
//请求获取==取消收藏
//- (void)request_RemoveFavorite_WithUserId:(NSString *)userId faId:(NSNumber *)faId andBlock:(void (^)(id data, NSError *error))block;
//请求获取==收藏列表
- (void)request_GetFavoriteList_WithUserId:(NSString *)userId fromId:(NSString *)fromId type:(NSNumber *)type pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;

/*
 * 积分
 */
//请求获取==积分详情
- (void)request_GetAccountList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;

/*
 * 消息
 */
//请求获取==消息信息，评论及赞个数
- (void)request_GetSimpleMessage_WithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;
//请求获取==我的评论
- (void)request_GetMyReply_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==我的赞
- (void)request_GetMyPraise_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求获取==我的系统消息
-(void)request_GetMyMessageInfo_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;

/*
 *社交相关
 */
//请求==关注别人
- (void)request_GetFocusUser_WithUserId:(NSString *)userId befocusUid:(NSString *)befocusUid stat:(NSNumber *)stat andBlock:(void (^)(id data, NSError *error))block;
//请求==拉黑别人
- (void)request_GetShieldUser_WithUserId:(NSString *)userId beshieldUid:(NSString *)beshieldUid stat:(NSNumber *)stat andBlock:(void (^)(id data, NSError *error))block;
//请求获取关注列表
- (void)request_GetFocusList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求==获取拉黑列表
- (void)request_GetShieldList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求==获取好友列表
- (void)request_GetFriendList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//请求==获取粉丝列表
- (void)request_GetFansList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
/*
 * 其他
 */
//请求获取==举报类型
- (void)request_GetTipType_WithUserId:(NSString *)userId andBlock:(void (^)(id data, NSError *error))block;
//请求提交==举报
- (void)request_SaveTip_WithTip:(MHTip *)tip andBlock:(void (^)(id data, NSError *error))block;
//请求==版本信息
- (void)request_GetSoftInfo_WithUserId:(NSString *)uid softType:(NSString *)softType andBlock:(void (^)(id data, NSError *error))block;
@end
