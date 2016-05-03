//
//  XJJokeViewModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJJokeViewModel.h"

@implementation XJJokeViewModel
-(NSMutableArray<XJJokeResultDataModel *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)getJokeWithCategory:(NSString *)category requestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _pageNum + 1;
    }
    [XJNetManager getJokeWithCategory:category page:tmpPage completionHandler:^(XJJokeModel *model, NSError *error) {
        if (!error) {
            _pageNum = tmpPage;
            if (requestMode == RequestModeRefresh){
                [self.dataList removeAllObjects];
            }
            MYLog(@"%@",model);
            [self.dataList addObjectsFromArray:model.result.data];
        }
        completionHandler(error);
    }];
}

-(NSString *)jokeForIndex:(NSInteger)index
{
    return self.dataList[index].content;
}

-(NSString *)createTimeForIndex:(NSInteger)index
{
    return self.dataList[index].updatetime;
}
@end
