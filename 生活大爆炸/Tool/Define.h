//
//  Define.h
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define NEWSBASEPATH @"http://op.juhe.cn/onebox/news/words"
#define NEWSAPPKEY @"25bf1d712927c82c31808cc98e6ac007"

#define JOKEBASEPATH @"http://japi.juhe.cn/joke/content/text.from"
#define JOKEAPPKEY @"d7d3e94aed7b42f63cd1d4bf5d759286"

#define DISHBASEPATH @"http://apis.juhe.cn/cook/query.php"
#define DISHDETIALBASEPATH @"http://apis.juhe.cn/cook/queryid"
#define DISHCATEGORYBASEPATH @"http://apis.juhe.cn/cook/category"
#define DISHAPPKEY @"4ccda19f4a481f4445bb459b75442954"

#define WEATHERBASEPATH @"http://op.juhe.cn/onebox/weather/query"
#define WEATHERAPPKEY @"1bb7e84e3bf0476ecff7df00666de540"

#define CONSTELLATIONBASEPATH @"http://web.juhe.cn:8080/constellation/getAll"
#define CONSTELLATIONAPPKEY @"5665329c110e235838732c1a4916f8e1"


//屏幕宽,高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_FRAME [UIScreen mainScreen].bounds

//在宏中使用\可以达到换行的效果
#define WK(weakSelf) \
__weak __typeof(&*self)weakSelf = self;

#define COLLECTION @"collection"

#endif /* Define_h */
