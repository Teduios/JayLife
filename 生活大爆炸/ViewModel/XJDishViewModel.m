//
//  XJDishViewModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishViewModel.h"

@implementation XJDishViewModel
-(NSMutableArray<XJDishResultDataModel *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
-(void)getDishDataWithDishName:(NSString *)dishName requestMode:(RequestMode)requestMode CompletionHandler:(void (^)(XJDishModel *, NSError *))completionHandler
{
    NSInteger tmpPage = 0;
    if (requestMode == RequestModeMore) {
        tmpPage = _pageNum + 15;
    }
    [XJNetManager getDishDataWithDishName:dishName RN:tmpPage CompletionHandler:^(XJDishModel *model, NSError *error) {
        if (!error) {
            _pageNum = tmpPage;
            if (requestMode == RequestModeRefresh){
                [self.dataList removeAllObjects];
            }
            //NSLog(@"%@",model);
            [self.dataList addObjectsFromArray:model.result.data];
        }
        completionHandler(nil,error);
    }];
  
}
-(NSString *)tagsForIndex:(NSInteger)index
{
    return self.dataList[index].tags;
}
-(NSString *)urlForIndex:(NSInteger)index
{
    return self.dataList[index].albums.lastObject;
}
-(NSString *)burdenForIndex:(NSInteger)index
{
    return self.dataList[index].burden;
}
-(NSString *)introduceForIndex:(NSInteger)index
{
    return self.dataList[index].imtro;
}
-(NSString *)nameForIndex:(NSInteger)index
{
    return  self.dataList[index].title;
}
-(NSString *)ingredientsForIndex:(NSInteger)index
{
    return self.dataList[index].ingredients;
}
-(NSString *)cidForIndex:(NSInteger)index
{
    return self.dataList[index].ID;
}
@end
