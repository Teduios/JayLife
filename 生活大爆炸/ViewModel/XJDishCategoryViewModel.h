//
//  XJDishCategoryViewModel.h
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
@interface XJDishCategoryViewModel : NSObject
@property (nonatomic, strong) NSMutableArray<XJDishResultListModel *> *dataList;
@property (nonatomic, assign) NSInteger pageNum;
- (NSString *)dishNameForIndex:(NSInteger)index;
- (void)getDishNameCompletionHandler:(void(^)(XJDishCategoryModel *model, NSError *error))completionHandler;
@end
