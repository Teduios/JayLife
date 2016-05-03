//
//  XJDishModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XJDishResultModel,XJDishResultDataModel,XJDishResultListStepsModel;
@interface XJDishModel : NSObject

@property (nonatomic, strong) XJDishResultModel *result;

@property (nonatomic, copy) NSString *resultcode;

@property (nonatomic, copy) NSString *reason;
//error_code -> errorCode
@property (nonatomic, assign) NSInteger errorCode;

@end
@interface XJDishResultModel : NSObject

@property (nonatomic, copy) NSString *totalNum;

@property (nonatomic, strong) NSArray<XJDishResultDataModel *> *data;

@property (nonatomic, assign) NSInteger pn;

@property (nonatomic, assign) NSInteger rn;

@end

@interface XJDishResultDataModel : NSObject

@property (nonatomic, copy) NSString *burden;

@property (nonatomic, strong) NSArray<NSString *> *albums;

@property (nonatomic, copy) NSString *imtro;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *ingredients;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<XJDishResultListStepsModel *> *steps;

@property (nonatomic, copy) NSString *tags;

@end

@interface XJDishResultListStepsModel : NSObject

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *step;

@end

