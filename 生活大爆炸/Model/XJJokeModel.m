//
//  XJJokeModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJJokeModel.h"

@implementation XJJokeModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorCode": @"error_code"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":  [XJJokeResultModel class]};
}
@end
@implementation XJJokeResultModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data":  [XJJokeResultDataModel class]};
}
@end


@implementation XJJokeResultDataModel

@end


