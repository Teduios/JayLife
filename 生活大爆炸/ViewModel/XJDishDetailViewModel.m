//
//  XJDishDetailViewModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishDetailViewModel.h"

@implementation XJDishDetailViewModel
-(NSMutableArray<XJDishDetailResultDataStepsModel *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

-(void)getDishDetailWithKey:(NSInteger)cid CompletionHandler:(void (^)(XJDishDetialModel *, NSError *))completionHandler
{
    [XJNetManager getDishDetailWithKey:cid CompletionHandler:^(XJDishDetialModel *model, NSError *error) {
        if (!error) {
            [self.dataList addObjectsFromArray:model.result.data.lastObject.steps];
        }
        completionHandler(nil,error);
    }];
}

-(NSString *)urlOfIndex:(NSInteger)index
{
    return self.dataList[index].img;
}
-(NSString *)descriptionOfIndex:(NSInteger)index
{
    return self.dataList[index].step;
}
@end
