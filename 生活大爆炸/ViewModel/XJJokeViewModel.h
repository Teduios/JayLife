//
//  XJJokeViewModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJNetManager.h"
typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh, //刷新数据
    RequestModeMore, //获取更多数据
};
@interface XJJokeViewModel : NSObject
@property (nonatomic, strong) NSMutableArray<XJJokeResultDataModel *> *dataList;
@property (nonatomic, assign) NSInteger pageNum;
- (NSString *)jokeForIndex:(NSInteger)index;
- (void)getJokeWithCategory:(NSString *)category requestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
-(NSString *)createTimeForIndex:(NSInteger) index;
@end
