//
//  XJConstellationController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJConstellationController.h"
#import "XJConstellationDetailController.h"
@interface XJConstellationController ()
@property (nonatomic,strong)UIButton *button;
@end

@implementation XJConstellationController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor yellowColor];
    [self createView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createView
{
    for (int i = 0 ; i < 4; i ++) {
        for (int j = 0; j < 3; j ++) {
            UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(j*SCREEN_WIDTH/3, i*(SCREEN_HEIGHT/4-40), SCREEN_WIDTH/3, SCREEN_HEIGHT/4-40)];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/3 - 60)*0.5, 20, 60, 60)];
            UILabel *namelabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/3 - 80)*0.5, 95, 80, 25)];
            namelabel.textAlignment = NSTextAlignmentCenter;
            UILabel *timelabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/3 - 80)*0.5, 123, 80, 25)];
            timelabel.textAlignment = NSTextAlignmentCenter;
            self.button = [[UIButton alloc]initWithFrame:subView.bounds];
            [self.button addTarget:self action:@selector(openConstellation:) forControlEvents:UIControlEventTouchUpInside];
            [subView addSubview:self.button];
            [subView addSubview:imageView];
            [subView addSubview:namelabel];
            [subView addSubview:timelabel];
            if (i == 0 && j == 0) {
                imageView.image = [UIImage imageNamed:@"baiy"];
                namelabel.text = @"白羊座";
                self.button.tag = 100;
            }
            if (i == 0 && j == 1) {
                imageView.image = [UIImage imageNamed:@"jingn"];
                namelabel.text = @"金牛座";
                self.button.tag = 110;
            }
            if (i == 0 && j == 2) {
                imageView.image = [UIImage imageNamed:@"shuangz"];
                namelabel.text = @"双子座";
                _button.tag = 120;
            }
            if (i == 1 && j == 0) {
                imageView.image = [UIImage imageNamed:@"jux"];
                namelabel.text = @"巨蟹座";
                _button.tag = 130;
            }
            if (i == 1 && j == 1) {
                imageView.image = [UIImage imageNamed:@"shiz"];
                namelabel.text = @"狮子座";
                _button.tag = 140;
            }
            if (i == 1 && j == 2) {
                imageView.image = [UIImage imageNamed:@"chun"];
                namelabel.text = @"处女座";
                _button.tag = 150;
            }
            if (i == 2 && j == 0) {
                imageView.image = [UIImage imageNamed:@"tanp"];
                namelabel.text = @"天秤座";
                _button.tag = 160;
            }
            if (i == 2 && j == 1) {
                imageView.image = [UIImage imageNamed:@"tianx"];
                namelabel.text = @"天蝎座";
                _button.tag = 170;
            }
            if (i == 2 && j == 2) {
                imageView.image = [UIImage imageNamed:@"shes"];
                namelabel.text = @"射手座";
                _button.tag = 180;
            }
            if (i == 3 && j == 0) {
                imageView.image = [UIImage imageNamed:@"moj"];
                namelabel.text = @"摩羯座";
                _button.tag = 190;
            }
            if (i == 3 && j == 1) {
                imageView.image = [UIImage imageNamed:@"shuip"];
                namelabel.text = @"水瓶座";
                _button.tag = 200;
            }
            if (i == 3 && j == 2) {
                imageView.image = [UIImage imageNamed:@"shuangy"];
                namelabel.text = @"双鱼座";
                _button.tag = 210;
            }
            [self.view addSubview:subView];
        }
    }
    
}

-(void)openConstellation:(UIButton *)sender
{
    if (sender.tag == 100) {
        NSLog(@"白羊座");
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"白羊座";
        [self presentViewController:cdVC animated:YES completion:nil];
    }
    if (sender.tag == 110) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"金牛座";
        [self presentViewController:cdVC animated:YES completion:nil];
    }
    if (sender.tag == 120) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"双子座";
        [self presentViewController:cdVC animated:YES completion:nil];

    }
    if (sender.tag == 130) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"巨蟹座";
        [self presentViewController:cdVC animated:YES completion:nil];
    }
    if (sender.tag == 140) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"狮子座";
        [self presentViewController:cdVC animated:YES completion:nil];
    }
    if (sender.tag == 150) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"处女座";
        [self presentViewController:cdVC animated:YES completion:nil];

    }
    if (sender.tag == 160) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"天秤座";
        [self presentViewController:cdVC animated:YES completion:nil];
    }
    if (sender.tag == 170) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"天蝎座";
        [self presentViewController:cdVC animated:YES completion:nil];

    }
    if (sender.tag == 180) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"射手座";
        [self presentViewController:cdVC animated:YES completion:nil];
    }
    if (sender.tag == 190) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"摩羯座";
        [self presentViewController:cdVC animated:YES completion:nil];

    }
    if (sender.tag == 200) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"水瓶座";
        [self presentViewController:cdVC animated:YES completion:nil];

    }
    if (sender.tag == 210) {
        XJConstellationDetailController *cdVC=[[XJConstellationDetailController alloc]init ];
        cdVC.type = @"双鱼座";
        [self presentViewController:cdVC animated:YES completion:nil];
    }
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
