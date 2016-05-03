//
//  XJNewsViewModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJNewsViewModel.h"

@implementation XJNewsViewModel
-(NSMutableArray<NSString *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)getNewsWithCategory:(NSString *)category requestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _pageNum + 1;
    }
    [XJNetManager getNewsWithCategory:category page:0 completionHandler:^(XJNewsModel *model, NSError *error) {
        if (!error) {
            _pageNum = tmpPage;
            if (requestMode == RequestModeRefresh){
                [self.dataList removeAllObjects];
            }
            MYLog(@"%@",model);
            [self.dataList addObjectsFromArray:model.result];
        }
        completionHandler(error);
    }];
}

-(NSString *)newsForIndex:(NSInteger)index
{
    return self.dataList[index];
}
@end
