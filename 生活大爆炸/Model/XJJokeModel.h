//
//  XJJokeModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XJJokeResultModel,XJJokeResultDataModel;
@interface XJJokeModel : NSObject
//error_code->errorCode
@property (nonatomic, assign) NSInteger errorCode;

@property (nonatomic, strong) XJJokeResultModel *result;

@property (nonatomic, copy) NSString *reason;

@end

@interface XJJokeResultModel : NSObject

@property (nonatomic, strong) NSArray<XJJokeResultDataModel *> *data;

@end

@interface XJJokeResultDataModel : NSObject

@property (nonatomic, assign) NSInteger unixtime;

@property (nonatomic, copy) NSString *updatetime;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *hashId;

@end

