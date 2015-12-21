////
////  Coding_NetAPIManager.m
////  Coding_iOS
////
////  Created by 王 原闯 on 14-7-30.
////  Copyright (c) 2014年 Coding. All rights reserved.
////
//
//#import "MH_NetAPIManager.h"
//
//@implementation MH_NetAPIManager
//+ (instancetype)sharedManager {
//    static MH_NetAPIManager *shared_manager = nil;
//    static dispatch_once_t pred;
//	dispatch_once(&pred, ^{
//        shared_manager = [[self alloc] init];
//    });
//	return shared_manager;
//}
//
////- (void)request_Register_WithToken:(NSString *)token thirdToken:(NSString *)thirdToken andBlock:(void (^)(id data, NSError *error))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if(token!=nil){
////        [dict setObject:token forKey:@"token"];
////    }
////    if(thirdToken!=nil){
////        [dict setObject:thirdToken forKey:@"wxToken"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kregister withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
////            block(dictData, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
////
////- (void)request_UpdateUser_WithUser:(MHUser *)user andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    [dict setObject:user.uid forKey:@"uid"];
////    [dict setObject:user.is_update_all forKey:@"is_update_all"];
////    if(user.nick!=nil){
////        [dict setObject:user.nick forKey:@"nick"];
////    }
////    if(user.avatar!=nil){
////        [dict setObject:user.avatar forKey:@"avatar"];
////    }
////    if(user.gender!=nil){
////        [dict setObject:user.gender forKey:@"gender"];
////    }
////    if(user.age!=nil){
////        [dict setObject:user.age forKey:@"age"];
////    }
////    if(user.motto!=nil){
////        [dict setObject:user.motto forKey:@"motto"];
////    }
////    if(user.phone!=nil){
////        [dict setObject:user.phone forKey:@"phone"];
////    }
////    NSString *picList=[user.picList JSONString];
////    if(user.picList!=nil){
////        [dict setObject:picList forKey:@"picList"];
////    }
////    if(user.marriageStat!=nil){
////        [dict setObject:user.marriageStat forKey:@"marriageStat"];
////    }
////    NSString *tagMap=[user.tagMap JSONString];
////    if(user.tagMap!=nil){
////        [dict setObject:tagMap forKey:@"tagList"];
////    }
////    if(user.position!=nil){
////        [dict setObject:user.position forKey:@"position"];
////    }
////    if(user.backgroundPicture!=nil){
////        [dict setObject:user.backgroundPicture forKey:@"backgroundPicture"];
////    }
////    if(user.birthday!=nil){
////        [dict setObject:user.birthday forKey:@"birthday"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kupdateUser withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
////            NSString *info=@"失败";
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                info=@"成功";
////            }else{
////                [MHGlobalFunction showHUD:message];
////            }
////            block(info, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////
////}
////
////- (void)request_GetUserInfo_WithUserId:(NSString *)userId queryer:(NSString *)queryer andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    [dict setObject:userId forKey:@"uid"];
////    if(queryer!=nil){
////        [dict setObject:queryer forKey:@"queryer"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kgetUserInfo withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
//////            NSString *message=[dictData objectForKey:@"message"];
////            MHUser *user=nil;
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                NSDictionary *dict=[dictData objectForKey:@"value"];
////                user=[MHUser userWithDict:dict];
////            }else{
//////                [MHGlobalFunction showHUD:message];
////            }
////            block(user, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
////
////- (void)request_SendNote_WithUserId:(NSString *)uid phone:(NSString *)phone andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if (uid) {
////        [dict setObject:uid forKey:@"uid"];
////    }
////    [dict setObject:phone forKey:@"phone"];
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:ksendNote withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
////            NSString *info=@"失败";
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                info=@"成功";
////            }else{
////                [MHGlobalFunction showHUD:message];
////            }
////            block(info, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
////
////- (void)request_savePhoneAndPassword_WithUserId:(NSString *)uid phone:(NSString *)phone password:(NSString *)password varCode:(NSString *)verCode andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if(uid){
////        [dict setObject:uid forKey:@"uid"];
////    }
////    if(phone){
////        [dict setObject:phone forKey:@"phone"];
////    }
////    if(password){
////        [dict setObject:password forKey:@"password"];
////    }
////    if(verCode){
////        [dict setObject:verCode forKey:@"verCode"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:ksavePhoneAndPassword withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
////            NSString *info=@"失败";
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                info=@"成功";
////            }else{
////                [MHGlobalFunction showHUD:message];
////            }
////            block(info, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
//
////
////- (void)request_updateUserPhone_WithUserId:(NSString *)uid phone:(NSString *)phone password:(NSString *)password varCode:(NSString *)verCode andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if (uid) {
////        [dict setObject:uid forKey:@"uid"];
////    }
////    if(phone){
////        [dict setObject:phone forKey:@"phone"];
////    }
////    if(password){
////        [dict setObject:password forKey:@"password"];
////    }
////    if(verCode){
////        [dict setObject:verCode forKey:@"verCode"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kupdateUserPhone withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
////            NSString *info=@"失败";
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                info=@"成功";
////            }else{
////                [MHGlobalFunction showHUD:message];
////            }
////            block(info, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
//
////- (void)request_GetUserDynamicInfo_WithUserId:(NSString *)uid dynamicUid:(NSString *)dynamicUid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if(uid!=nil){
////        [dict setObject:uid forKey:@"uid"];
////    }
////    if(dynamicUid!=nil){
////        [dict setObject:dynamicUid forKey:@"dynamicUid"];
////    }
////    if(fromId!=nil){
////        [dict setObject:fromId forKey:@"fromId"];
////    }
////    if(pageSize!=nil){
////        [dict setObject:pageSize forKey:@"pageSize"];
////    }
////    if(pageNow!=nil){
////        [dict setObject:pageNow forKey:@"pageNow"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kgetUserDynamicInfo withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSMutableArray *userDynamicArray=[NSMutableArray arrayWithCapacity:1];
////            //            NSString *message=[dictData objectForKey:@"message"];
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                NSArray *values=[dictData objectForKey:@"value"];
////                if(values!=nil&&values.count>0){
////                    for (NSDictionary *dict in values) {
////                        MHUserDynamic *userDynamic=[MHUserDynamic userDynamicWithDict:dict];
////                        if([userDynamic.infoType intValue]==MHInfoActivity){
////                            MHActivity *activity=[MHActivity activityWithDict:[dict objectForKey:@"dynamicObj"]];
////                            userDynamic.activity=activity;
////                        }else if([userDynamic.infoType intValue]==MHInfoPost){
////                            MHPost *post=[MHPost postWithDict:[dict objectForKey:@"dynamicObj"]];
////                            userDynamic.post=post;
////                        }
////                        [userDynamicArray addObject:userDynamic];
////                    }
////                }
////            }else{
////                //                [MHGlobalFunction showHUD:message];
////            }
////            block(userDynamicArray, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
//
////
////- (void)request_Headline_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if(userId!=nil){
////        [dict setObject:userId forKey:@"uid"];
////    }
////    if(fromId!=nil){
////        [dict setObject:fromId forKey:@"fromId"];
////    }
////    if(pageSize!=nil){
////        [dict setObject:pageSize forKey:@"pageSize"];
////    }
////    if(pageNow!=nil){
////        [dict setObject:pageNow forKey:@"pageNow"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:khead withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSMutableArray *headlineArray=[NSMutableArray arrayWithCapacity:1];
//////            NSString *message=[dictData objectForKey:@"message"];
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                NSArray *values=[dictData objectForKey:@"value"];
////                if(values!=nil&&values.count>0){
////                    for (NSDictionary *dict in values) {
////                        MHHeadline *heaadline=[[MHHeadline alloc]init];
////                        heaadline.fid=[dict objectForKey:@"id"];
////                        heaadline.type=[dict objectForKey:@"type"];
////                        heaadline.infoId=[dict objectForKey:@"infoId"];
////                        heaadline.status=[dict objectForKey:@"status"];
////                        heaadline.outputTime=[dict objectForKey:@"outputTime"];
////                        NSDictionary *info=[dict objectForKey:@"info"];
////                        if([heaadline.type isEqual:[NSNumber numberWithInt:1]]){
////                            MHNew *news=[MHNew newWithDict:info];
////                            heaadline.news=news;
////                        }else if([heaadline.type isEqual:[NSNumber numberWithInt:2]]){
////                            MHPost *post=[MHPost postWithDict:info];
////                            heaadline.post=post;
////                        }else if([heaadline.type isEqual:[NSNumber numberWithInt:3]]){
////                            MHActivity *activity=[MHActivity activityWithDict:info];
////                            heaadline.activity=activity;
////                        }
////                        [headlineArray addObject:heaadline];
////                    }
////                }
////            }else{
//////                [MHGlobalFunction showHUD:message];
////            }
////            block(headlineArray, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
//
////- (void)request_NewsDetail_WithUserId:(NSString *)uid infoId:(NSString *)infoId andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if(uid!=nil){
////        [dict setObject:uid forKey:@"uid"];
////    }
////    if(infoId!=nil){
////        [dict setObject:infoId forKey:@"infoId"];
////    }
////
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kgetInfomation withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
//////            NSString *message=[dictData objectForKey:@"message"];
////            MHNew *news=nil;
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                NSArray *values=[dictData objectForKey:@"value"];
////                if(values!=nil&&values.count>0){
////                    NSDictionary *dict=[values objectAtIndex:0];
////                    news=[MHNew newWithDict:dict];
////                }
////            }else{
//////                [MHGlobalFunction showHUD:message];
////            }
////            block(news, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
////
////- (void)request_Ad_WithUserId:(NSString *)uid aid:(NSString *)aid andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if(uid!=nil){
////        [dict setObject:uid forKey:@"uid"];
////    }
////    if(aid!=nil){
////        [dict setObject:aid forKey:@"aid"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kheadad withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
//////            NSString *message=[dictData objectForKey:@"message"];
////            MHAdvertisement *ad=nil;
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                NSDictionary *values=[dictData objectForKey:@"value"];
////                ad=[MHAdvertisement adWithDict:values];
////            }else{
//////                [MHGlobalFunction showHUD:message];
////            }
////            block(ad, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
////
////- (void)request_Launchad_WithUserId:(NSString *)userId andBlock:(void (^)(id, NSError *))block{
////    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
////    if(userId!=nil){
////        [dict setObject:userId forKey:@"uid"];
////    }
////    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:klaunchad withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
////        if (data) {
////            NSDictionary *dictData=[NSDictionary changeType:data];
//////            NSString *message=[dictData objectForKey:@"message"];
////            MHAdvertisement *ad=nil;
////            bool success=[[dictData objectForKey:@"success"] boolValue];
////            if(success){
////                NSDictionary *values=[dictData objectForKey:@"value"];
////                ad=[MHAdvertisement adWithDict:values];
////            }else{
////                //                [MHGlobalFunction showHUD:message];
////            }
////            block(ad, nil);
////        }else{
////            block(nil, error);
////        }
////    }];
////}
//
//- (void)request_GroupList_WithUserId:(NSString *)userId andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kgroupList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *groupListArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    NSMutableArray *isarry=[NSMutableArray arrayWithCapacity:1];
//                    NSMutableArray *noarry=[NSMutableArray arrayWithCapacity:1];
//                    for (NSDictionary *dict in values) {
//                        NSNumber *follow=[dict objectForKey:@"follow"];
//                        MHGroup *group=[MHGroup groupWithDict:dict];
//                        if([follow isEqual:[NSNumber numberWithInt:1]]){
//                            [isarry addObject:group];
//                        }else{
//                            [noarry addObject:group];
//                        }
//                    }
//                    if(isarry.count>0){
//                        [groupListArray addObject:isarry];
//                    }
//                    if(noarry.count>0){
//                        [groupListArray addObject:noarry];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(groupListArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GroupDetail_WithUserId:(NSString *)userId gid:(NSNumber *)gid andBlock:(void (^)(id data, NSError *error))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(gid!=nil){
//        [dict setObject:gid forKey:@"gid"];
//    }
//
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kgroupDetail withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
//            MHGroup *group=nil;
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSDictionary *dict=[dictData objectForKey:@"value"];
//                group=[MHGroup groupWithDict:dict];
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(group, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_FollowGroup_WithUserId:(NSString *)uid gid:(NSNumber *)gid ifFollow:(NSNumber *)ifFollow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(ifFollow!=nil){
//        [dict setObject:ifFollow forKey:@"ifFollow"];
//    }
//    if(uid!=nil){
//        [dict setObject:uid forKey:@"uid"];
//    }
//    if(gid!=nil){
//        [dict setObject:gid forKey:@"gid"];
//    }
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kfollowGroup withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GetGroupType_WithUserId:(NSString *)uid andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:uid forKey:@"uid"];
//
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kgetGroupType withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *groupArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(![values isEqual:[NSNull null]]&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHGroup *group=[MHGroup groupWithDict:dict];
//                        [groupArray addObject:group];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(groupArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_PostList_WithGid:(NSNumber *)gid fromId:(NSString *)fromId userId:(NSString *)uid pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(uid!=nil){
//        [dict setObject:uid forKey:@"uid"];
//    }
//    if(gid!=nil){
//        [dict setObject:gid forKey:@"gid"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kpostList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *postArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(![values isEqual:[NSNull null]]&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHPost *post=[MHPost postWithDict:dict];
//                        [postArray addObject:post];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(postArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_PostOtherList_WithGid:(NSNumber *)gid fromId:(NSString *)fromId userId:(NSString *)userId pageSize:(NSString *)pageSize ownerUserId:(NSString *)ownerUserId pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(gid!=nil){
//        [dict setObject:gid forKey:@"gid"];
//    }
//    if(ownerUserId!=nil){
//        [dict setObject:ownerUserId forKey:@"ownerUserId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kpostOtherList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *postArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(![values isEqual:[NSNull null]]&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHPost *post=[MHPost postWithDict:dict];
//                        [postArray addObject:post];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(postArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_PostDetail_WithPid:(NSString *)pid uid:(NSString *)uid andBlock:(void (^)(id data, NSError *error))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(pid!=nil){
//        [dict setObject:pid forKey:@"pid"];
//    }
//    if(uid!=nil){
//        [dict setObject:uid forKey:@"uid"];
//    }
//
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kpostDetail withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
//            MHPost *post=nil;
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSDictionary *dict=[dictData objectForKey:@"value"];
//                post=[MHPost postWithDict:dict];
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(post, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_SavePost_WithPost:(MHPost *)post andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    NSString *str=[post.picList JSONString];
//    if(post.pid!=nil){
//        [dict setObject:post.pid forKey:@"pid"];
//    }
//    if(post.picList!=nil){
//        [dict setObject:str forKey:@"picList"];
//    }
//    if(post.uid!=nil){
//        [dict setObject:post.uid forKey:@"uid"];
//    }
//    if(post.title!=nil){
//        [dict setObject:post.title forKey:@"title"];
//    }
//    if(post.gid!=nil){
//        [dict setObject:post.gid forKey:@"gid"];
//    }
//    if(post.content!=nil){
//        [dict setObject:post.content forKey:@"content"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:ksavePost withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_DeletePost_WithPid:(NSString *)pid uid:(NSString *)uid andBlock:(void (^)(id data, NSError *error))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(pid!=nil){
//        [dict setObject:pid forKey:@"pid"];
//    }
//    if(uid!=nil){
//        [dict setObject:uid forKey:@"uid"];
//    }
//    [[CodingNetAPIClient sharedJsonClient] requestJsonDataWithPath:kdeletePost withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_NewsList_WithUserId:(NSString *)uid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(uid!=nil){
//        [dict setObject:uid forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:knewsList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *newArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHNew *new=[MHNew newWithDict:dict];
//                        [newArray addObject:new];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(newArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_UnReadNewsCount_WithUserId:(NSString *)uid andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(uid!=nil){
//        [dict setObject:uid forKey:@"uid"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kunReadNewsCount withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
//            NSDictionary *values=nil;
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                values=[dictData objectForKey:@"value"];
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(values, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_ReplyList_WithType:(NSNumber *)type infoId:(NSString *)infoId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(type!=nil){
//        [dict setObject:type forKey:@"type"];
//    }
//    if(infoId!=nil){
//        [dict setObject:infoId forKey:@"infoId"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kreplyList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *replyArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHReply *reply=[MHReply replyWithDict:dict];
//                        [replyArray addObject:reply];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(replyArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_ReplyNum_WithType:(NSNumber *)type infoId:(NSString *)infoId andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(type!=nil){
//        [dict setObject:type forKey:@"type"];
//    }
//    if(infoId!=nil){
//        [dict setObject:infoId forKey:@"infoId"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kreplyNum withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
//            NSNumber *commentNum=nil;
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                commentNum=[dictData objectForKey:@"value"];
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(commentNum, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_SaveReply_WithReply:(MHReply *)reply andBlock:(void (^)(id, NSError *))block{
//    NSDictionary *dict=nil;
//    if(reply.rid!=nil){
//        dict=@{@"rid":reply.rid,@"type":reply.type,@"infoId":reply.infoId,
//               @"uid":reply.uid,@"content":reply.content,@"replyId":reply.replyId};
//    }else if(reply.replyUid!=nil){
//        dict=@{@"type":reply.type,@"infoId":reply.infoId,@"uid":reply.uid,
//               @"content":reply.content,@"replyId":reply.replyId,@"replyUid":reply.replyUid};
//    }else{
//        dict=@{@"type":reply.type,@"infoId":reply.infoId,@"uid":reply.uid,@"content":reply.content};
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:ksaveReply withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_DelReply_WithRid:(NSString *)rid type:(NSNumber *)type infoId:(NSString *)infoId andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(rid!=nil){
//        [dict setObject:rid forKey:@"rid"];
//    }
//    if(type!=nil){
//        [dict setObject:type forKey:@"type"];
//    }
//    if(infoId!=nil){
//        [dict setObject:infoId forKey:@"infoId"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kdelReply withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_SelectActions_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kselectActions withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *actionArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHActivity *activity=[MHActivity activityWithDict:dict];
//                        [actionArray addObject:activity];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(actionArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_AllActions_WithUserId:(NSString *)userId fromId:(NSString *)fromId typeCode:(NSString *)typeCode outAid:(NSString *)outAid isOwner:(NSString *)isOwner pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(typeCode!=nil){
//        [dict setObject:typeCode forKey:@"typeCode"];
//    }
//    if(outAid!=nil){
//        [dict setObject:outAid forKey:@"outAid"];
//    }
//    if(isOwner!=nil){
//        [dict setObject:isOwner forKey:@"ownerUserId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kallActions withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *actionArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHActivity *activity=[MHActivity activityWithDict:dict];
//                        [actionArray addObject:activity];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(actionArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_SaveOrUpdateAction_WithActivity:(MHActivity *)activity andBlock:(void (^)(id, NSError *))block{
//    NSDictionary *dict;
//    NSString *str=[activity.picList JSONString];
//    if(activity.aid==nil){
//        
//            dict=@{@"uid":activity.uid,@"title":activity.title,@"address":activity.address,
//                   @"startTime":activity.startTime,@"picList":str,
//                   @"content":activity.content,@"typeCode":activity.typeCode,
//                   @"type":activity.type,@"memberNumLimit":activity.memberNumLimit,
//                   @"endTime":activity.endTime,@"cost":activity.cost,@"isPhone":activity.isPhone,
//                   @"sighupTime":activity.sighupTime};
//    }else{
//        dict=@{@"aid":activity.aid,@"uid":activity.uid,@"title":activity.title,
//               @"address":activity.address,@"startTime":activity.startTime,
//               @"picList":str,@"content":activity.content,
//               @"typeCode":activity.typeCode,@"type":activity.type,
//               @"memberNumLimit":activity.memberNumLimit,@"endTime":activity.endTime,
//               @"cost":activity.cost,@"isPhone":activity.isPhone,
//               @"sighupTime":activity.sighupTime};
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:ksaveOrUpdateAction withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GetActionType_WithUserId:(NSString *)userId andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetActionType withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *typeArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHActivityType *type=[MHActivityType activityTypeWithDict:dict];
//                        [typeArray addObject:type];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(typeArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
//
//- (void)request_GetActionById_WithUserId:(NSString *)userId aid:(NSString *)aid andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(aid!=nil){
//        [dict setObject:aid forKey:@"aid"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetActionById withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            MHActivity *activity=nil;
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSDictionary *values=[dictData objectForKey:@"value"];
//                activity=[MHActivity activityWithDict:values];
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(activity, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GetActionMembers_WithUserId:(NSString *)userId aid:(NSString *)aid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    if(aid!=nil){
//        [dict setObject:aid forKey:@"aid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetActionMembers withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *memberArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSDictionary *values=[dictData objectForKey:@"value"];
//              NSNumber *count = [values objectForKey:@"count"];
//                NSArray *actionMembers = [values objectForKey:@"actionMembers"];
//                if(actionMembers!=nil&&actionMembers.count>0){
//                    for (NSDictionary *dict in actionMembers) {
//                        MHActivityMember *member=[MHActivityMember activityMemberWithDict:dict];
//                        member.count = count;
//                        [memberArray addObject:member];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(memberArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//
//- (void)request_ApplyAction_WithUserId:(NSString *)userId aid:(NSString *)aid realname:(NSString *)realname phone:(NSString *)phone stat:(NSNumber *)stat andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    if(aid!=nil){
//        [dict setObject:aid forKey:@"aid"];
//    }
//    if(phone!=nil){
//        [dict setObject:phone forKey:@"phone"];
//    }
//    if(realname!=nil){
//        [dict setObject:realname forKey:@"realname"];
//    }
//    [dict setObject:stat forKey:@"stat"];
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kapplyAction withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_JoinActionList_WithUserId:(NSString *)uid fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(uid!=nil){
//        [dict setObject:uid forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kjoinActionList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *actionArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHActivity *activity=[MHActivity activityWithDict:dict];
//                        [actionArray addObject:activity];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(actionArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
//
//- (void)request_AddPraise_WithUserId:(NSString *)userId type:(NSNumber *)type infoId:(NSString *)infoId stat:(NSNumber *)stat andBlock:(void (^)(id data, NSError *error))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    [dict setObject:type forKey:@"type"];
//    if(infoId!=nil){
//        [dict setObject:infoId forKey:@"infoId"];
//    }
//    if(stat!=nil){
//        [dict setObject:stat forKey:@"stat"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kaddPraise withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GetPraiseList_WithUserId:(NSString *)userId type:(NSNumber *)type infoId:(NSString *)infoId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow softNum:(NSString *)softNum andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    [dict setObject:type forKey:@"type"];
//    if(infoId!=nil){
//        [dict setObject:infoId forKey:@"infoId"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    if(softNum!=nil){
//        [dict setObject:softNum forKey:@"softNum"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetPraiseList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *praiseArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHPraise *praise=[MHPraise praiseWithDict:dict];
//                        [praiseArray addObject:praise];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(praiseArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_SaveOrUpdateFavorite_WithUserId:(NSString *)userId type:(NSNumber *)type infoId:(NSString *)infoId stat:(NSNumber *)stat andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    [dict setObject:type forKey:@"type"];
//    if(infoId!=nil){
//        [dict setObject:infoId forKey:@"infoId"];
//    }
//    if(stat!=nil){
//        [dict setObject:stat forKey:@"stat"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:ksaveOrUpdateFavorite withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_RemoveFavorite_WithUserId:(NSString *)userId faId:(NSString *)faId andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    if(faId!=nil){
//        [dict setObject:faId forKey:@"id"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kremoveFavorite withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GetFavoriteList_WithUserId:(NSString *)userId fromId:(NSString *)fromId type:(NSNumber *)type pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    [dict setObject:type forKey:@"type"];
//    [dict setObject:fromId forKey:@"fromId"];
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetFavoriteList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *collectionArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                 if(values!=nil&&values.count>0){
//                     for (NSDictionary *dict in values) {
//                         MHCollection *collection=[MHCollection collectionWithDict:dict];
//                         [collectionArray addObject:collection];
//                     }
//                 }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(collectionArray, nil);
//        }else{
//            block(nil, error);
//        }
//
//    }];
//}
//
//- (void)request_GetAccountList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    [dict setObject:fromId forKey:@"pageFromId"];
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetAccountList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            block(dictData, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
//
//- (void)request_GetSimpleMessage_WithUserId:(NSString *)userId andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:userId forKey:@"uid"];
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetSimpleMessage withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSDictionary *values=nil;
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                values=[dictData objectForKey:@"value"];
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(values, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
//
//- (void)request_GetMyReply_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetMyReply withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *replyArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHMyReply *reply=[MHMyReply myReplyWithDict:dict];
//                        if ([reply.type intValue] == MHInfoPost) {
//                            NSDictionary *postDict=[dict objectForKey:@"messagObj"];
//                            if(![postDict isEqual:@""]){
//                                reply.post = [MHPost postWithDict:postDict];
//                            }
//                        }else if ([reply.type intValue] == MHInfoScene){
//                            NSDictionary *sceneDict=[dict objectForKey:@"messagObj"];
//                            if(![sceneDict isEqual:@""]){
//                                reply.scene = [MHScene sceneWithDict:sceneDict];
//                            }
//                        }
//                        [replyArray addObject:reply];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(replyArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GetMyPraise_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetMyPraise withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *praiseArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHMyPraise *praise=[MHMyPraise myPraiseWithDict:dict];
//                        if([praise.type intValue]==MHInfoActivity){
//                            praise.activity=[MHActivity activityWithDict:[dict objectForKey:@"messagObj"]];
//                        }else if([praise.type intValue] == MHInfoPost){
//                            praise.post = [MHPost postWithDict:[dict objectForKey:@"messagObj"]];
//                        }else if ([praise.type intValue]==MHInfoScene){
//                            praise.scene = [MHScene sceneWithDict:[dict objectForKey:@"messagObj"]];
//                        }
//                        [praiseArray addObject:praise];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(praiseArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
//
//-(void)request_GetMyMessageInfo_WithUserId:(NSString *)userId fromId:(NSString *)fromId pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id data, NSError *error))block;
//{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetMyMessage withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *systemMessageArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHSystemMessage *activity=[MHSystemMessage systemMessageWithDict:dict];
//                        [systemMessageArray addObject:activity];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(systemMessageArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_GetTipType_WithUserId:(NSString *)userId andBlock:(void (^)(id, NSError *))block{
//    NSDictionary *dict=@{@"uid":userId};
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetTipType withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *tipTypeArray=[NSMutableArray arrayWithCapacity:1];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        MHTipType *tipType=[MHTipType tipTypeWithDict:dict];
//                        [tipTypeArray addObject:tipType];
//                    }
//                }
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(tipTypeArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//- (void)request_SaveTip_WithTip:(MHTip *)tip andBlock:(void (^)(id, NSError *))block{
//    NSDictionary *dict=@{@"uid":tip.uid,@"type":tip.type,@"infoId":tip.infoId,@"tipInfo":tip.tipInfo,@"tipType":tip.tipType,@"stat":tip.stat};
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:ksaveTip withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
//
//- (void)request_GetSoftInfo_WithUserId:(NSString *)uid softType:(NSString *)softType andBlock:(void (^)(id data, NSError *error))block{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setObject:uid forKey:@"uid"];
//    [dict setObject:softType forKey:@"softType"];
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetSoftInfo withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
////            NSString *message=[dictData objectForKey:@"message"];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            NSDictionary *values=nil;
//            if(success){
//                values=[dictData objectForKey:@"value"];
//            }else{
////                [MHGlobalFunction showHUD:message];
//            }
//            block(values, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
////社交相关
////请求==关注别人
//- (void)request_GetFocusUser_WithUserId:(NSString *)userId befocusUid:(NSString *)befocusUid stat:(NSNumber *)stat andBlock:(void (^)(id, NSError *))block
//{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(befocusUid!=nil){
//        [dict setObject:befocusUid forKey:@"befocusUid"];
//    }
//    if(stat!=nil){
//        [dict setObject:stat forKey:@"stat"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetFocusUser withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
////请求==拉黑别人
//-(void)request_GetShieldUser_WithUserId:(NSString *)userId beshieldUid:(NSString *)beshieldUid stat:(NSNumber *)stat andBlock:(void (^)(id, NSError *))block
//{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(beshieldUid!=nil){
//        [dict setObject:beshieldUid forKey:@"beshieldUid"];
//    }
//    if(stat!=nil){
//        [dict setObject:stat forKey:@"stat"];
//    }
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetShieldUser withParams:dict withMethodType:Post andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSString *message=[dictData objectForKey:@"message"];
//            NSString *info=@"失败";
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                info=@"成功";
//            }else{
//                [MHGlobalFunction showHUD:message];
//            }
//            block(info, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
////请求获取关注列表
//-(void) request_GetFocusList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block
//{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if (fromTime!=nil) {
//        [dict setObject:fromTime forKey:@"fromTime"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetFocusList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *focusListArray=[NSMutableArray arrayWithCapacity:1];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        focusUser *focusList =[focusUser focusUserWithDict:dict];
//                        [focusListArray addObject:focusList];
//                    }
//                }
//            }else{
//                //                [MHGlobalFunction showHUD:message];
//            }
//            block(focusListArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//
//}
////请求==获取拉黑列表
//-(void)request_GetShieldList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block
//{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if (fromTime!=nil) {
//        [dict setObject:fromTime forKey:@"fromTime"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetShieldList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *shieldListArray=[NSMutableArray arrayWithCapacity:1];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        blackUser *blackList =[blackUser blackUserWithDict:dict];
//                        [shieldListArray addObject:blackList];
//                    }
//                }
//            }else{
//                //                [MHGlobalFunction showHUD:message];
//            }
//            block(shieldListArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//
//}
//
////请求==获取好友列表
//-(void) request_GetFriendList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block
//{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if (fromTime!=nil) {
//        [dict setObject:fromTime forKey:@"fromTime"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetFriendList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *friendListArray=[NSMutableArray arrayWithCapacity:1];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        focusUser *friendList =[focusUser focusUserWithDict:dict];
//                        [friendListArray addObject:friendList];
//                    }
//                }
//            }else{
//                //                [MHGlobalFunction showHUD:message];
//            }
//            block(friendListArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//
//-(void) request_GetFansList_WithUserId:(NSString *)userId fromId:(NSNumber *)fromId fromTime:(NSString *)fromTime pageSize:(NSString *)pageSize pageNow:(NSNumber *)pageNow andBlock:(void (^)(id, NSError *))block
//{
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:1];
//    if(userId!=nil){
//        [dict setObject:userId forKey:@"uid"];
//    }
//    if(fromId!=nil){
//        [dict setObject:fromId forKey:@"fromId"];
//    }
//    if (fromTime!=nil) {
//        [dict setObject:fromTime forKey:@"fromTime"];
//    }
//    if(pageSize!=nil){
//        [dict setObject:pageSize forKey:@"pageSize"];
//    }
//    if(pageNow!=nil){
//        [dict setObject:pageNow forKey:@"pageNow"];
//    }
//    
//    [[CodingNetAPIClient sharedJsonClient]requestJsonDataWithPath:kgetFansList withParams:dict withMethodType:Get andBlock:^(id data, NSError *error) {
//        if (data) {
//            NSDictionary *dictData=[NSDictionary changeType:data];
//            NSMutableArray *friendListArray=[NSMutableArray arrayWithCapacity:1];
//            bool success=[[dictData objectForKey:@"success"] boolValue];
//            if(success){
//                NSArray *values=[dictData objectForKey:@"value"];
//                if(values!=nil&&values.count>0){
//                    for (NSDictionary *dict in values) {
//                        focusUser *friendList =[focusUser focusUserWithDict:dict];
//                        [friendListArray addObject:friendList];
//                    }
//                }
//            }else{
//                //                [MHGlobalFunction showHUD:message];
//            }
//            block(friendListArray, nil);
//        }else{
//            block(nil, error);
//        }
//    }];
//}
//@end