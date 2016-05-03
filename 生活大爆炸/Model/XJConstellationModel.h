//
//  XJConstellationModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJConstellationModel : NSObject

@property (nonatomic, copy) NSString *money;

@property (nonatomic, copy) NSString *resultcode;
//error_code->errorCode
@property (nonatomic, assign) NSInteger errorCode;

@property (nonatomic, copy) NSString *work;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *love;

@property (nonatomic, assign) NSInteger date;

@property (nonatomic, copy) NSString *health;

@property (nonatomic, assign) NSInteger number;

@property (nonatomic, copy) NSString *QFriend;

@property (nonatomic, copy) NSString *all;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *datetime;

@end
