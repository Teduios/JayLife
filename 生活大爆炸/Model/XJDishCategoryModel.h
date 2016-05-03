//
//  XJDishCategoryModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XJDishResultModel1,XJDishResultListModel;
@interface XJDishCategoryModel : NSObject

@property (nonatomic, strong) NSArray<XJDishResultModel1 *> *result;

@property (nonatomic, copy) NSString *resultcode;

@property (nonatomic, copy) NSString *reason;
//error_code -> errorCode
@property (nonatomic, assign) NSInteger errorCode;

@end
@interface XJDishResultModel1 : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *parentId;

@property (nonatomic, strong) NSArray<XJDishResultListModel *> *list;

@end

@interface XJDishResultListModel : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *parentId;

@end

