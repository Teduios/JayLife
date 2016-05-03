//
//  XJNetManager.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJNewsModel.h"
#import "XJJokeModel.h"
#import "XJConstellationModel.h"
#import "XJDishModel.h"
#import "XJDishDetialModel.h"
#import "XJDishCategoryModel.h"
@interface XJNetManager : NSObject
+ (void)getNewsWithCategory:(NSString *)category page:(NSInteger)page completionHandler:(void(^)(XJNewsModel *model, NSError *error))completionHandler;
+ (void)getJokeWithCategory:(NSString *)category page:(NSInteger)page completionHandler:(void(^)(XJJokeModel *model, NSError *error))completionHandler;
+ (void)getConstellationWithConsName:(NSString *)consName type:(NSString *)type completionHandler:(void(^)(XJConstellationModel *model, NSError *error))completionHandler;
+ (void)getDishNameCompletionHandler:(void(^)(XJDishCategoryModel *model, NSError *error))completionHandler;
+ (void)getDishDataWithDishName:(NSString *)dishName RN:(NSInteger)rn CompletionHandler:(void(^)(XJDishModel *model, NSError *error))completionHandler;
+ (void)getDishDetailWithKey:(NSInteger)cid CompletionHandler:(void(^)(XJDishDetialModel *model, NSError *error))completionHandler;
@end
