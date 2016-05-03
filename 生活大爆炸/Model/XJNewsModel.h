//
//  XJNewsModel.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJNewsModel : NSObject

@property (nonatomic, strong) NSArray<NSString *> *result;
//error_code -> errorCode
@property (nonatomic, assign) NSInteger errorCode;

@property (nonatomic, copy) NSString *reason;

@end
