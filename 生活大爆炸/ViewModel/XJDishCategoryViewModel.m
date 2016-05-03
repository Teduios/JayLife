//
//  XJDishCategoryViewModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishCategoryViewModel.h"

@implementation XJDishCategoryViewModel
-(NSMutableArray<XJDishResultListModel *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
-(void)getDishNameCompletionHandler:(void (^)(XJDishCategoryModel *, NSError *))completionHandler
{
    [XJNetManager getDishNameCompletionHandler:^(XJDishCategoryModel *model, NSError *error) {
        if (!error) {
            NSLog(@"%@",model);
            [self.dataList addObjectsFromArray:model.result.lastObject.list];
        }
        completionHandler(nil,error);
    }];

}
-(NSString *)dishNameForIndex:(NSInteger)index
{
    return self.dataList[index].name;
}
@end
