////
////  MH_UploadImageManager.m
////  vomoho
////
////  Created by AloesLu on 15/10/9.
////  Copyright © 2015年 AloesLu. All rights reserved.
////
//
//#import "MH_UploadImageManager.h"
//
//
//typedef NS_ENUM(NSUInteger, DemoStatus) {
//    DemoStatusReady = 0,
//    DemoStatusSuccess = 1,
//    DemoStatusFailed = 2,
//    DemoStatusUploading = 3,
//    DemoStatusCancel = 4
//};
//
//@implementation MH_UploadImageManager
//+ (instancetype)sharedManager {
//    static MH_UploadImageManager *shared_manager = nil;
//    static dispatch_once_t pred;
//    dispatch_once(&pred, ^{
//        shared_manager = [[self alloc] init];
//    });
//    return shared_manager;
//}
//
//- (void)uploadImageToALBB:(NSMutableDictionary *)dict andBlock:(void (^)(id data, NSError *error))block{
//    [dict setObject:@0 forKey:@"dTime"];
//    [dict setObject:@0 forKey:@"timeUsed"];
//    [dict setObject:@"" forKey:@"url"];
//    [dict setObject:@0 forKey:@"status"];
//    [dict setObject:@0 forKey:@"sizeUploaded"];
//    double ts = [[NSDate new] timeIntervalSince1970];
//    [dict setValue:[NSNumber numberWithDouble:ts] forKey:@"timeStart"];
//    
//    TFEUploadNotification *notification = [TFEUploadNotification
//                                           notificationWithProgress:^(TFEUploadSession *session, NSUInteger progress) {
//                                               NSLog(@"%lu", (unsigned long) progress);
//                                               [dict setObject:[NSNumber numberWithInt:DemoStatusUploading] forKey:@"status"];
//                                               [dict setObject:[NSNumber numberWithUnsignedLong:progress] forKey:@"progress"];
//                                               [dict setObject:[NSNumber numberWithUnsignedLong:session.sizeUploaded] forKey:@"sizeUploaded"];
//                                           }
//                                           success:^(TFEUploadSession *session, NSString *url) {
//                                               NSLog(@"%@", session);
//                                               [dict setObject:[NSNumber numberWithInt:DemoStatusSuccess] forKey:@"status"];
//                                               [dict setObject:session.responseUrl forKey:@"url"];
//                                               [dict setObject:[NSNumber numberWithDouble:([[NSDate new] timeIntervalSince1970] - session.startTime) * 1000] forKey:@"timeUsed"];
//                                               block(dict,nil);
//                                           }
//                                           failed:^(TFEUploadSession *session, NSError *error) {
//                                               NSLog(@"error happend. %@", error);
//                                               [dict setObject:session.isCanceled ? @4 : @2 forKey:@"status"];
//                                               [dict setObject:[NSNumber numberWithDouble:([[NSDate new] timeIntervalSince1970] - session.startTime) * 1000] forKey:@"timeUsed"];
//                                               block(dict,error);
//                                           }];
//    DEMO_ALBBM.locationPath=[dict objectForKey:@"locationPath"];
//    NSString *id = demoUpload(DEMO_TYPE_ASSET, [NSURL URLWithString:[dict objectForKey:@"assetsUrl"]], [dict objectForKey:@"name"], notification);
//    if (id)
//        [dict setObject:id forKey:@"taskId"];
//}
//
//- (void)uploadImageDataToALBB:(NSMutableDictionary *)dict andBlock:(void (^)(id, NSError *))block{
//    [dict setObject:@0 forKey:@"dTime"];
//    [dict setObject:@0 forKey:@"timeUsed"];
//    [dict setObject:@"" forKey:@"url"];
//    [dict setObject:@0 forKey:@"status"];
//    [dict setObject:@0 forKey:@"sizeUploaded"];
//    double ts = [[NSDate new] timeIntervalSince1970];
//    [dict setValue:[NSNumber numberWithDouble:ts] forKey:@"timeStart"];
//    TFEUploadNotification *notification = [TFEUploadNotification
//                                           notificationWithProgress:^(TFEUploadSession *session, NSUInteger progress) {
//                                               NSLog(@"%lu", (unsigned long) progress);
//                                               [dict setObject:[NSNumber numberWithInt:DemoStatusUploading] forKey:@"status"];
//                                               [dict setObject:[NSNumber numberWithUnsignedLong:progress] forKey:@"progress"];
//                                               [dict setObject:[NSNumber numberWithUnsignedLong:session.sizeUploaded] forKey:@"sizeUploaded"];
//                                               
//                                           }
//                                           success:^(TFEUploadSession *session, NSString *url) {
//                                               
//                                               [dict setObject:[NSNumber numberWithDouble:([[NSDate new] timeIntervalSince1970] - session.startTime) * 1000] forKey:@"timeUsed"];
//                                               NSLog(@"%@", session);
//                                               [dict setObject:[NSNumber numberWithInt:DemoStatusSuccess] forKey:@"status"];
//                                               [dict setObject:session.responseUrl forKey:@"url"];
//                                               block(dict,nil);
//                                           }
//                                           failed:^(TFEUploadSession *session, NSError *error) {
//                                               NSLog(@"error happend.%@", error);
//                                               if (session.isCanceled) {
//                                                   [dict setObject:[NSNumber numberWithInt:DemoStatusCancel] forKey:@"status"];
//                                               } else {
//                                                   [dict setObject:[NSNumber numberWithInt:DemoStatusFailed] forKey:@"status"];
//                                               }
//                                               block(dict,error);
//                                           }];
//    DEMO_ALBBM.locationPath=[dict objectForKey:@"locationPath"];
//    NSString *id = demoUpload(DEMO_TYPE_DATA, [dict objectForKey:@"imageData"],[dict objectForKey:@"name"], notification);
//    if (id)
//        [dict setObject:id forKey:@"taskId"];
//}
//@end
