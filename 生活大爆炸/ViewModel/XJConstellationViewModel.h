//
//  XJConstellationViewModel.h
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
@interface XJConstellationViewModel : NSObject
@property(nonatomic,strong)XJConstellationModel *model;
- (NSString *)content;
- (NSString *)totalLucky;
- (NSString *)workEfficiency;
- (NSInteger )luckyNumber;
- (NSString *)Qfridend;
- (NSString *)health;
- (NSString *)dateTime;
- (NSString *)money;
- (NSString *)love;
- (NSString *)luckyColor;
- (void)getConstellationWithConsName:(NSString *)consName type:(NSString *)type completionHandler:(void(^)(XJConstellationModel *model, NSError *error))completionHandler;
@end
