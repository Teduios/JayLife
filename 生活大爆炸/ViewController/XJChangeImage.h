//
//  XJChangeImage.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XJChangeImage;
@protocol FinishSelectHeadImage <NSObject>

-(void)FinishSelectHeadImageWith:(XJChangeImage*)svc andHeadImage:(UIImage*)headImage;

@end
@interface XJChangeImage : UIViewController

@property(nonatomic,strong)UIImage* headimage_head;
@property(nonatomic,weak)id<FinishSelectHeadImage> delegate;

@end
