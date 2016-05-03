//
//  XJDishDetialModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishDetialModel.h"

@implementation XJDishDetialModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorCode": @"error_code"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":  [XJDishDetailResultModel class]};
}
@end
@implementation XJDishDetailResultModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data" : [XJDishDetailResultDataModel class]};
}

@end


@implementation XJDishDetailResultDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"steps" : [XJDishDetailResultDataStepsModel class]};
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID": @"id"};
}
@end


@implementation XJDishDetailResultDataStepsModel

@end


