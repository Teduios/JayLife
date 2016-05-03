//
//  XJDishModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishModel.h"

@implementation XJDishModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorCode": @"error_code"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":  [XJDishResultModel class]};
}
@end
@implementation XJDishResultModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data" : [XJDishResultDataModel class]};
}

@end

@implementation XJDishResultDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"steps" : [XJDishResultListStepsModel class]};
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID": @"id"};
}
@end


@implementation XJDishResultListStepsModel

@end


