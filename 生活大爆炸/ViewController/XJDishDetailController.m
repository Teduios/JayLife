//
//  XJDishDetailController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishDetailController.h"
#import "XJDishDetailViewModel.h"
#import "XJNetManager.h"
#import "UIImageView+WebCache.h"
@interface XJDishDetailController () <UIScrollViewDelegate>
@property (nonatomic ,strong)UIScrollView *sv;
@property (nonatomic ,strong)XJDishDetailViewModel *ddVM;
@end

@implementation XJDishDetailController
-(XJDishDetailViewModel *)ddVM
{
    if (!_ddVM) {
        _ddVM = [XJDishDetailViewModel new];
    }
    return _ddVM;
}
- (void)viewDidLoad {
   
    WK(weakSelf);
    [self.ddVM getDishDetailWithKey:[self.CID integerValue] CompletionHandler:^(XJDishDetialModel *model, NSError *error) {
        if (error) {
           [weakSelf.view showWarning:error.localizedDescription];
        }else
        {
             [self configScrollView];
            UIButton *backButton =[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT-60, 50, 50)];
            [backButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
            [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:backButton];
        }
    } ];
  
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view from its nib.
}
//设置 scrollView
-(void)configScrollView {
    self.sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20)];
    [self.view addSubview:self.sv];
    
    //设置内容大小
    self.sv.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT/5*self.ddVM.dataList.count);
    
    //设置显示内容
    for (int i = 0; i < self.ddVM.dataList.count; i++) {
        UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, i*SCREEN_HEIGHT/5, SCREEN_WIDTH, SCREEN_HEIGHT/5)];
        UIImageView *subImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20 , 15 , 150, subView.height-30)];
        [subImageView sd_setImageWithURL:[NSURL URLWithString:[self.ddVM urlOfIndex:i]]];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(180, 10, subView.width - 185, subView.height-20)];
        label.numberOfLines = 0;
        label.text = [self.ddVM descriptionOfIndex:i];
        [subView addSubview:subImageView];
        [subView addSubview:label];
        [self.sv addSubview:subView];
    }
    [self.view addSubview:self.sv];
    //设置 关闭弹跳效果
    self.sv.bounces = NO;
    
    //设置 ScrollView的代理 为当前对象
    self.sv.delegate = self;
    
}

-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
