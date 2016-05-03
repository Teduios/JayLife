//
//  XJConstellationViewModel.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJConstellationViewModel.h"

@implementation XJConstellationViewModel
-(void)getConstellationWithConsName:(NSString *)consName type:(NSString *)type completionHandler:(void (^)(XJConstellationModel *, NSError *))completionHandler
{
    [XJNetManager getConstellationWithConsName:consName type:type completionHandler:^(XJConstellationModel *model, NSError *error) {
        if (!error) {
            self.model = model;
        }
        completionHandler(nil,error);
    }];
}

-(NSString *)content
{
    return self.model.summary;
}

-(NSString *)luckyColor
{
    return self.model.color;
}
-(NSString *)dateTime
{
    return self.model.datetime;
}
-(NSInteger)luckyNumber
{
    return self.model.number;
}
-(NSString *)Qfridend
{
    return self.model.QFriend;
}
-(NSString *)totalLucky
{
    return self.model.all;
}
-(NSString *)workEfficiency
{
    return self.model.work;
}
-(NSString *)health
{
    return self.model.health;
}
-(NSString *)money
{
    return self.model.money;
}
-(NSString *)love
{
    return self.model.love;
}
@end
