//
//  XJDishDetailViewModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJNetManager.h"
@interface XJDishDetailViewModel : NSObject
@property (nonatomic, strong) NSMutableArray<XJDishDetailResultDataStepsModel *> *dataList;
-(void)getDishDetailWithKey:(NSInteger)cid CompletionHandler:(void(^)(XJDishDetialModel *model, NSError *error))completionHandler;
-(NSString *)urlOfIndex:(NSInteger )index;
-(NSString *)descriptionOfIndex:(NSInteger) index;
@end
