////
//// Created by huamulou on 15/5/31.
//// Copyright (c) 2015 alibaba. All rights reserved.
////
//
////#import <ALBBMediaService/ALBBMediaService.h>
//#import <TAESDK/TaeSDK.h>
//#import "ALBBMedia.h"
//#import "Constants.h"
//
//
//@implementation ALBBMedia {
//
//}
//
//TFE_DEMO_SHARE_INSTANCE
//
//
//static id <ALBBMediaServiceProtocol> staticTaeFileEngine;
//
//- (id <ALBBMediaServiceProtocol>)taeFileEngine {
//    if (!staticTaeFileEngine) {
//        staticTaeFileEngine = [[TaeSDK sharedInstance] getService:@protocol(ALBBMediaServiceProtocol)];
//        if (!staticTaeFileEngine) {
//            [[TaeSDK sharedInstance] asyncInit];
//        }
//    }
//    return staticTaeFileEngine;
//}
//
//
//- (NSString *)upload:(int)type param:(id)param uuid:(NSString *)_uuid notification:(TFEUploadNotification *)notification {
//    switch (type) {
//        case  DEMO_TYPE_FILE:
//            return [self uploadByFile:param uuid:(NSString *)_uuid notification:notification];
//        case DEMO_TYPE_DATA:
//            return [self uploadByData:param uuid:(NSString *)_uuid notification:notification];
//        case DEMO_TYPE_ASSET:
//            return [self uploadByAsset:param uuid:(NSString *)_uuid notification:notification];
//    }
//    return nil;
//}
//
//
//- (NSString *)uploadByFile:(NSString *)filePath uuid:(NSString *)_uuid notification:(TFEUploadNotification *)notification {
//    TFEUploadParameters *params = [TFEUploadParameters
//            paramsWithFilePath:filePath
//                                   space:[NSObject baseURLStrIsTest] ? DEMO_NAMESPACE_dev:DEMO_NAMESPACE_pd
//                      fileName:_uuid
//                           dir:_locationPath];
//
//    return [DEMO_ENGINE upload:params notification:notification];
//}
//
//- (NSString *)uploadByData:(NSData *)data uuid:(NSString *)_uuid notification:(TFEUploadNotification *)notification {
//    TFEUploadParameters *params = [TFEUploadParameters
//            paramsWithData:data
//                 space:[NSObject baseURLStrIsTest] ? DEMO_NAMESPACE_dev:DEMO_NAMESPACE_pd
//                  fileName:_uuid
//                       dir:_locationPath];
//
//    return [DEMO_ENGINE upload:params notification:notification];
//
//}
//
//- (NSString *)uploadByAsset:(NSURL *)assetUrl uuid:(NSString *)_uuid notification:(TFEUploadNotification *)notification {
//    TFEUploadParameters *params = [TFEUploadParameters
//            paramsWithAssertUrl:assetUrl
//                      space:[NSObject baseURLStrIsTest] ? DEMO_NAMESPACE_dev:DEMO_NAMESPACE_pd
//                       fileName:_uuid
//                            dir:_locationPath];
//
//    return [DEMO_ENGINE upload:params notification:notification];
//}
//
//
///**
//* 生成一个uuid
//*/
//- (NSString *)uniqueString {
//    CFUUIDRef uuidObj = CFUUIDCreate(nil);
//    NSString *uuidString = (__bridge_transfer NSString *) CFUUIDCreateString(nil, uuidObj);
//    CFRelease(uuidObj);
//    return uuidString;
//}
//
//
//@end