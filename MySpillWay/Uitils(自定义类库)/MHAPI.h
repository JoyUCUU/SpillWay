//
//  MHAPI.h
//  vomoho
//
//  Created by AloesLu on 15/9/28.
//  Copyright © 2015年 AloesLu. All rights reserved.
//

#ifndef MHAPI_h
#define MHAPI_h

/*
 *个人中心
 */
//注册或登录
#define kregister @"api/register.do"
//修改个人信息
#define kupdateUser @"api/updateUser.do"
//获取用户个人信息
#define kgetUserInfo @"api/getUserInfo.do"
//用户绑定手机或者修改手机号码发送短信验证码
#define ksendNote @"api/sendNote.do"
//用户绑定手机号码及密码
#define ksavePhoneAndPassword @"api/savePhoneAndPassword.do"
//用户重新绑定手机接口
#define kupdateUserPhone @"api/updateUserPhone.do"
//个人动态
#define kgetUserDynamicInfo @"api/getUserDynamicInfo.do"
/*
 *头条
 */
//获取头条消息
#define khead @"api/head.do"
//获取头条上方广告消息
#define kheadad @"api/headad.do"
//获取launch页图片
#define klaunchad @"api/launchad.do"
//获取咨询详情信息
#define kgetInfomation @"api/getInfomation.do"
/*
 *圈子
 */
//获取板块列表
#define kgroupList @"api/groupList.do"
//获取板块详情
#define kgroupDetail @"api/groupDetail.do"
//关注或取消板块
#define kfollowGroup @"api/followGroup.do"
//获取圈子类型
#define kgetGroupType @"api/getGroupType.do"
/*
 *帖子
 */
//获取帖子列表
#define kpostList @"api/postList.do"
//获取我的帖子列表
#define kpostOtherList @"api/postOtherList.do"
//获取帖子详情
#define kpostDetail @"api/postDetail.do"
//创建获修改帖子(post方式)
#define ksavePost @"api/savePost.do"
//获取资讯条数和logoUrl
#define kunReadNewsCount @"api/unReadNewsCount.do"
//获取资讯列表
#define knewsList @"api/newsList.do"
//删除帖子
#define kdeletePost @"api/deletePost.do"
/*
 *玩乐
 */
//获取精选活动列表
#define kselectActions @"api/selectActions.do"
//获取活动列表
#define kallActions @"api/allActions.do"
//保存修改活动
#define ksaveOrUpdateAction @"api/saveOrUpdateAction.do"
//获取活动类型
#define kgetActionType @"api/getActionType.do"
//获取活动详情
#define kgetActionById @"api/getActionById.do"
//获取活动报名人员列表
#define kgetActionMembers @"api/getActionMembers.do"
//活动报名
#define kapplyAction @"api/applyAction.do"
//获取我的活动
#define kjoinActionList @"api/joinActionList.do"
/*
 *评论
 */
//获取某个资讯、活动、帖子多条评论
#define kreplyList @"api/replyList.do"
//获取某个资讯、活动、帖子评论数
#define kreplyNum @"api/replyNum.do"
//添加、修改评论
#define ksaveReply @"api/saveReply.do"
//删除评论
#define kdelReply @"api/delReply.do"
/*
 *收藏
 */
//添加收藏
#define ksaveOrUpdateFavorite @"api/saveOrUpdateFavorite.do"
//取消收藏
#define kremoveFavorite @"api/removeFavorite.do"
//获取收藏列表
#define kgetFavoriteList @"api/getFavoriteList.do"
/*
 *收藏
 */
//点赞
#define kaddPraise @"api/addPraise.do"
//获取点赞列表
#define kgetPraiseList @"api/getPraiseList.do"
/*
 *积分
 */
//获取积分详情信息
#define kgetAccountList @"api/getAccountList.do"
/*
 *消息
 */
//获取消息信息，评论及赞个数
#define kgetSimpleMessage @"api/getSimpleMessage.do"
//获取我的评论
#define kgetMyReply @"api/getMyReply.do"
//获取我的赞
#define kgetMyPraise @"api/getMyPraise.do"
//获取我的系统消息
#define kgetMyMessage @"api/getMyMessageInfo.do"

/**
 *社交相关
 */
#define kgetFocusUser @"api/focusUser.do"
#define kgetShieldUser @"api/shieldUser.do"
#define kgetFocusList @"api/focusList.do"
#define kgetShieldList @"api/shieldList.do"
#define kgetFriendList @"api/friendList.do"
#define kgetFansList @"api/fansList.do"
/*
 *其他
 */
//获取举报类型
#define kgetTipType @"api/getTipType.do"
//举报
#define ksaveTip @"api/saveTip.do"
//获取版本信息
#define kgetSoftInfo @"api/getSoftInfo.do"

#endif /* MHAPI_h */
