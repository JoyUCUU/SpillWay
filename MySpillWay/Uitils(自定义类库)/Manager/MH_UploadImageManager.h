//
//  MH_UploadImageManager.h
//  vomoho
//
//  Created by AloesLu on 15/10/9.
//  Copyright © 2015年 AloesLu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MH_UploadImageManager : NSObject
+ (instancetype)sharedManager;

//通过文件上传
- (void)uploadImageToALBB:(NSMutableDictionary *)dict andBlock:(void (^)(id data, NSError *error))block;
//通过NSData上传
- (void)uploadImageDataToALBB:(NSMutableDictionary *)dict andBlock:(void (^)(id, NSError *))block;
@end
