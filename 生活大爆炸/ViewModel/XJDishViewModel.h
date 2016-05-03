//
//  XJDishViewModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJNetManager.h"
typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh, //刷新数据
    RequestModeMore, //获取更多数据
};
@interface XJDishViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<XJDishResultDataModel *> *dataList;
@property (nonatomic, assign) NSInteger pageNum;
- (NSString *)tagsForIndex:(NSInteger)index;
- (NSString *)urlForIndex:(NSInteger)index;
- (NSString *)nameForIndex:(NSInteger)index;
- (NSString *)introduceForIndex:(NSInteger)index;
- (NSString *)burdenForIndex:(NSInteger)index;
- (NSString *)ingredientsForIndex:(NSInteger)index;
- (NSString *)cidForIndex:(NSInteger)index;
- (void)getDishDataWithDishName:(NSString *)dishName requestMode:(RequestMode)requestMode CompletionHandler:(void(^)(XJDishModel *model, NSError *error))completionHandler;
@end
