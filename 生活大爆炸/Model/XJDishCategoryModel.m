//
//  XJDishCategoryModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishCategoryModel.h"

@implementation XJDishCategoryModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorCode": @"error_code"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":  [XJDishResultModel1 class]};
}
@end
@implementation XJDishResultModel1

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"list":  [XJDishResultListModel class]};
}

@end

@implementation XJDishResultListModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID": @"id"};
}
@end


