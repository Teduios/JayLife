//
//  XJJokeCell.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJJokeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *collection;

@end
