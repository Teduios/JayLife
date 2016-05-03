//
//  NSObject+Networking.h
//  笑话集结号
//
//  Created by 沈徐洁 on 16/4/19.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface NSObject (Networking)

+(id)GET:(NSString *)path parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completeHandler:(void(^)(id obj,NSError *error))completeHandler;

+(id)POST:(NSString *)path parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completeHandler:(void(^)(id obj,NSError *error))completeHandler;

@end
