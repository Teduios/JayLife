//
//  XJLifeController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJLifeController.h"
#import "XJJokeController.h"
#import "XJNewsController.h"
#import "XJWeatherController.h"
#import "XJDishCategoryController.h"
#import "XJConstellationController.h"

@interface XJLifeController ()

@end

@implementation XJLifeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return 4;
}

-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            return @"新闻";
            break;
        case 1:
            return @"菜谱";
            break;
        case 2:
            return @"笑话";
            break;
//        case 3:
//            return @"天气";
//            break;
        case 3:
            return @"星座";
            break;
        default:
            break;
    }
    return nil;
}

-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    
    //pageController.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    pageController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"MainTagSubIconClick"] style:
                                                      UIBarButtonItemStylePlain target:self action:@selector(popSelfInfo)];
    
    pageController.menuViewStyle = WMMenuViewStyleLine;
    pageController.titleSizeSelected = 15;
    if (index == 0) {
        return [XJNewsController new];
    }
    if (index == 1) {
        return [XJDishCategoryController new];
    }
    if (index == 2) {
        return [XJJokeController new];
    }
//    if (index == 3) {
//        return [XJWeatherController new];
//    }
    if (index == 3) {
        return [XJConstellationController new];
    }
    return nil;
}

-(void)popSelfInfo
{
    NSLog(@".....");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
