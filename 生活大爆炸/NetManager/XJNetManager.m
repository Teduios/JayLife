//
//  XJNetManager.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJNetManager.h"

@implementation XJNetManager
+ (void)getNewsWithCategory:(NSString *)category page:(NSInteger)page completionHandler:(void (^)(XJNewsModel *, NSError *))completionHandler{
    //@{字典} @[数组] @YES @1 @(数字变量)->NSNumber类型
    NSDictionary *pa = @{
                         @"key": NEWSAPPKEY,
                         };
    [self GET:NEWSBASEPATH parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            completionHandler([XJNewsModel parseJSON:responseObj],nil);
            //MYLog(@"%@",[XJNewsModel parseJSON:responseObj]);
        }else
        {
            completionHandler(nil,error);
        }
    }];
}
+ (void)getJokeWithCategory:(NSString *)category page:(NSInteger)page completionHandler:(void (^)(XJJokeModel *, NSError *))completionHandler{
    //@{字典} @[数组] @YES @1 @(数字变量)->NSNumber类型
    NSDictionary *pa = @{
                         @"key": JOKEAPPKEY,
                         @"pagesize":@(15),
                         @"page":@(page)
                         };
    [self GET:JOKEBASEPATH parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            completionHandler([XJJokeModel parseJSON:responseObj],nil);
            //MYLog(@"%@",[XJJokeModel parseJSON:responseObj]);
        }else
        {
            completionHandler(nil,error);
        }
    }];
}

+(void)getConstellationWithConsName:(NSString *)consName type:(NSString *)type completionHandler:(void (^)(XJConstellationModel *, NSError *))completionHandler
{
    //@{字典} @[数组] @YES @1 @(数字变量)->NSNumber类型
    NSDictionary *pa = @{
                         @"key": CONSTELLATIONAPPKEY,
                         @"consName": consName,
                         @"type" : type,
                         };
    [self GET:CONSTELLATIONBASEPATH parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            completionHandler([XJConstellationModel parseJSON:responseObj],nil);
            //MYLog(@"%@",[XJConstellationModel parseJSON:responseObj]);
        }else
        {
            completionHandler(nil,error);
        }
    }];
}

+(void)getDishNameCompletionHandler:(void (^)(XJDishCategoryModel *, NSError *))completionHandler
{
    NSDictionary *pa = @{
                         @"key": DISHAPPKEY,
                         @"parentid":@(10001)
                         };
    [self GET:DISHCATEGORYBASEPATH parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            completionHandler([XJDishCategoryModel parseJSON:responseObj],nil);
            //MYLog(@"%@",[XJDishCategoryModel parseJSON:responseObj]);
        }else
        {
            completionHandler(nil,error);
        }
    }];

}
+(void)getDishDataWithDishName:(NSString *)dishName RN:(NSInteger)rn  CompletionHandler:(void (^)(XJDishModel *, NSError *))completionHandler
{
    NSDictionary *pa = @{
                         @"key": DISHAPPKEY,
                         @"menu": dishName,
                         @"rn" :@(30),
                         @"pn":@(rn)
                         };
    [self GET:DISHBASEPATH parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            completionHandler([XJDishModel parseJSON:responseObj],nil);
            MYLog(@"%@",[XJDishModel parseJSON:responseObj]);
        }else
        {
            completionHandler(nil,error);
        }
    }];

}
+(void)getDishDetailWithKey:(NSInteger)cid CompletionHandler:(void (^)(XJDishDetialModel *, NSError *))completionHandler
{
    NSDictionary *pa = @{
                         @"key": DISHAPPKEY,
                         @"id": @(cid),
                         };
    [self GET:DISHDETIALBASEPATH parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            completionHandler([XJDishDetialModel parseJSON:responseObj],nil);
            MYLog(@"%@",[XJDishDetialModel parseJSON:responseObj]);
        }else
        {
            completionHandler(nil,error);
        }
    }];

}
@end
