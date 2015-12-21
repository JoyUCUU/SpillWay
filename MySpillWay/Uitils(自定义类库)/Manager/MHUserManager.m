////
////  MHUserManager.m
////  vomoho
////
////  Created by AloesLu on 15/11/21.
////  Copyright © 2015年 AloesLu. All rights reserved.
////
//#define kUserDefaults_userId @"userId"
//#define kUserDefaults_Avatar @"userAvatar"
//#define kUserDefaults_Nick @"userNick"
//#define kUserDefaults_Motto @"userMotto"
//#define kUserDefaults_Gender @"userGender"
//#define kUserDefaults_Phone @"userPhone"
//#define kUserDefaults_RegTime @"userRegTime"
//#define kUserDefaults_Username @"userUsername"
//
//#define kUserDefaults_openAccountId @"userOpenAccountId"
//#define kUserDefaults_picList @"userPicList"
//#define kUserDefaults_marriageStat @"userMarriageStat"
//#define kUserDefaults_tagMap @"userTagMap"
//#define kUserDefaults_position @"userPosition"
//#define kUserDefaults_age @"userAge"
//#define kUserDefaults_relation @"userRelation"
//#define kUserDefaults_backgroundPicture @"userBackgroundPicture"
//#define kUserDefaults_constellation @"userConstellation"
//#define kUserDefaults_birthday @"userBirthday"
//#define kUserDefaults_dynamicPictures @"dynamicPictures"
//
//#import "MHUserManager.h"
//
//
//@implementation MHUserManager
//+ (instancetype)sharedManager {
//    static MHUserManager *shared_manager = nil;
//    static dispatch_once_t pred;
//    dispatch_once(&pred, ^{
//        shared_manager = [[self alloc] init];
//    });
//    return shared_manager;
//}
///**
// *  获取MHUser set和get方法
// */
////- (void)setUserData:(MHUser *)user{
////    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
////    if(user.uid){
////        [defaults setObject:user.uid forKey:kUserDefaults_userId];
////    }
////    if(user.openAccountId){
////        [defaults setObject:user.openAccountId forKey:kUserDefaults_openAccountId];
////    }
////    if(user.picList){
////        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user.picList];
////        [defaults setObject:data forKey:kUserDefaults_picList];
////    }
////    if(user.avatar){
////        [defaults setObject:user.avatar forKey:kUserDefaults_Avatar];
////    }
////    if(user.nick){
////        [defaults setObject:user.nick forKey:kUserDefaults_Nick];
////    }
////    if(user.username){
////        [defaults setObject:user.username forKey:kUserDefaults_Username];
////    }
////    if(user.gender){
////        [defaults setObject:user.gender forKey:kUserDefaults_Gender];
////    }
////    if(user.birthday){
////        [defaults setObject:user.birthday forKey:kUserDefaults_birthday];
////    }
////    if(user.motto){
////        [defaults setObject:user.motto forKey:kUserDefaults_Motto];
////    }
////    if(user.marriageStat){
////        [defaults setObject:user.marriageStat forKey:kUserDefaults_marriageStat];
////    }
////    if(user.tagMap){
////        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user.tagMap];
////        [defaults setObject:data forKey:kUserDefaults_tagMap];
////    }
////    if(user.position){
////        [defaults setObject:user.position forKey:kUserDefaults_position];
////    }
////    
////    if(user.age){
////        [defaults setObject:user.age forKey:kUserDefaults_age];
////    }
////    if(user.constellation){
////        [defaults setObject:user.constellation forKey:kUserDefaults_constellation];
////    }
////    if(user.relation){
////        [defaults setObject:user.relation forKey:kUserDefaults_relation];
////    }
////    if(user.registerTime){
////        [defaults setObject:user.registerTime forKey:kUserDefaults_RegTime];
////    }
////    if(user.phone){
////        [defaults setObject:user.phone forKey:kUserDefaults_Phone];
////    }
////    if(user.backgroundPicture){
////        [defaults setObject:user.backgroundPicture forKey:kUserDefaults_backgroundPicture];
////    }
////    if(user.dynamicPictures){
////        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user.dynamicPictures];
////        [defaults setObject:data forKey:kUserDefaults_dynamicPictures];
////    }
////    [defaults synchronize];
////}
////- (MHUser *)getUserData{
////    MHUser *user=[[MHUser alloc]init];
////    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
////    user.uid=[defaults objectForKey:kUserDefaults_userId];
////    user.openAccountId=[defaults objectForKey:kUserDefaults_openAccountId];
////    NSMutableArray *arry = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:kUserDefaults_picList]];
////    user.picList=arry;
////    user.avatar=[defaults objectForKey:kUserDefaults_Avatar];
////    user.nick=[defaults objectForKey:kUserDefaults_Nick];
////    user.username=[defaults objectForKey:kUserDefaults_Username];
////    user.gender=[defaults objectForKey:kUserDefaults_Gender];
////    user.motto=[defaults objectForKey:kUserDefaults_Motto];
////    user.marriageStat=[defaults objectForKey:kUserDefaults_marriageStat];
////    NSMutableArray *arry1 = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:kUserDefaults_tagMap]];
////    user.tagMap=arry1;
////    user.position=[defaults objectForKey:kUserDefaults_position];
////    user.age=[defaults objectForKey:kUserDefaults_age];
////    user.constellation=[defaults objectForKey:kUserDefaults_constellation];
////    user.relation=[defaults objectForKey:kUserDefaults_relation];
////    user.registerTime=[defaults objectForKey:kUserDefaults_RegTime];
////    user.phone=[defaults objectForKey:kUserDefaults_Phone];
////    user.backgroundPicture=[defaults objectForKey:kUserDefaults_backgroundPicture];
////    user.birthday = [defaults objectForKey:kUserDefaults_birthday];
////    NSMutableArray *arry2 = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:kUserDefaults_dynamicPictures]];
////    user.dynamicPictures=arry2;
////    return user;
////}
//
///**
// *  获取userID set和get方法
// */
//- (void)setkUserDefaults_userId:(NSString *)userId{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:userId forKey:kUserDefaults_userId];
//    [defaults synchronize];
//}
//-(NSString *)getkUserDefaults_userId{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_userId];
//}
///**
// *  获取openAccountId set和get方法
// */
//- (void)setkUserDefaults_openAccountId:(NSString *)openAccountId{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:openAccountId forKey:kUserDefaults_openAccountId];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_openAccountId{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_openAccountId];
//}
///**
// *  获取picList set和get方法
// */
//- (void)setkUserDefaults_picList:(NSMutableArray *)picList {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:picList];
//    [defaults setObject:data forKey:kUserDefaults_picList];
//    [defaults synchronize];
//}
//- (NSMutableArray *)getkUserDefaults_picList {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *data = [defaults objectForKey:kUserDefaults_picList];
//    NSMutableArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    return myArray;
//}
///**
// *  获取avatar set和get方法
// */
//- (void)setkUserDefaults_Avatar:(NSString *)avatar{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:avatar forKey:kUserDefaults_Avatar];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_Avatar{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_Avatar];
//}
///**
// *  获取nick set和get方法
// */
//- (void)setkUserDefaults_Nick:(NSString *)nick{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:nick forKey:kUserDefaults_Nick];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_Nick{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_Nick];
//}
///**
// *  获取username set和get方法
// */
//- (void)setkUserDefaults_Username:(NSString *)username{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:username forKey:kUserDefaults_Username];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_Username{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_Username];
//}
///**
// *  获取gender set和get方法
// */
//- (void)setkUserDefaults_Gender:(NSNumber *)gender{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:gender forKey:kUserDefaults_Gender];
//    [defaults synchronize];
//}
//- (NSNumber *)getkUserDefaults_Gender{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_Gender];
//}
///**
// *  获取motto set和get方法
// */
//- (void)setkUserDefaults_Motto:(NSString *)motto{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:motto forKey:kUserDefaults_Motto];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_Motto{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_Motto];
//}
///**
// *  获取marriageStat set和get方法
// */
//- (void)setkUserDefaults_marriageStat:(NSNumber *)marriageStat{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:marriageStat forKey:kUserDefaults_marriageStat];
//    [defaults synchronize];
//}
//- (NSNumber *)getkUserDefaults_marriageStat{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_marriageStat];
//}
///**
// *  获取tagMap set和get方法
// */
//- (void)setkUserDefaults_tagMap:(NSMutableArray *)tagMap{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tagMap];
//    [defaults setObject:data forKey:kUserDefaults_tagMap];
//    [defaults synchronize];
//}
//- (NSMutableArray *)getkUserDefaults_tagMap{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    NSData *data = [defaults objectForKey:kUserDefaults_tagMap];
//    NSMutableArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    return myArray;
//}
///**
// *  获取position set和get方法
// */
//- (void)setkUserDefaults_position:(NSString *)position{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:position forKey:kUserDefaults_position];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_position{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_position];
//}
///**
// *  获取age set和get方法
// */
//- (void)setkUserDefaults_age:(NSNumber *)age{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:age forKey:kUserDefaults_age];
//    [defaults synchronize];
//}
//- (NSNumber *)getkUserDefaults_age{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_age];
//}
///**
// *  获取constellation set和get方法
// */
//- (void)setkUserDefaults_constellation:(NSString *)constellation{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:constellation forKey:kUserDefaults_constellation];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_constellation{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_constellation];
//}
///**
// *  获取relation set和get方法
// */
//- (void)setkUserDefaults_relation:(NSString *)relation{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:relation forKey:kUserDefaults_relation];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_relation{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_relation];
//}
///**
// *  获取registerTime set和get方法
// */
//- (void)setkUserDefaults_RegTime:(NSString *)registerTime{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:registerTime forKey:kUserDefaults_RegTime];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_RegTime{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_RegTime];
//}
///**
// *  获取registerTime set和get方法
// */
//- (void)setkUserDefaults_Phone:(NSString *)phone{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:phone forKey:kUserDefaults_Phone];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_Phone{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_Phone];
//}
///**
// *  获取backgroundPicture set和get方法
// */
//- (void)setkUserDefaults_backgroundPicture:(NSString *)backgroundPicture{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:backgroundPicture forKey:kUserDefaults_backgroundPicture];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_backgroundPicture{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_backgroundPicture];
//}
///**
// *  获取birthday set和get方法
// */
//- (void)setkUserDefaults_birthday:(NSString *)birthday{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:birthday forKey:kUserDefaults_birthday];
//    [defaults synchronize];
//}
//- (NSString *)getkUserDefaults_birthday{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:kUserDefaults_birthday];
//}
///**
// *  获取dynamicPictures set和get方法
// */
//- (void)setkUserDefaults_dynamicPictures:(NSMutableArray *)dynamicPictures{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dynamicPictures];
//    [defaults setObject:data forKey:kUserDefaults_dynamicPictures];
//    [defaults synchronize];
//}
//- (NSMutableArray *)getkUserDefaults_dynamicPictures{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    NSData *data = [defaults objectForKey:kUserDefaults_dynamicPictures];
//    NSMutableArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    return myArray;
//}
//
//@end
