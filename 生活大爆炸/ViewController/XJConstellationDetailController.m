//
//  XJConstellationDetailController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJConstellationDetailController.h"
#import "XJConstellationViewModel.h"
#import "XJNetManager.h"
@interface XJConstellationDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *totalLucky;
@property (weak, nonatomic) IBOutlet UILabel *effiency;
@property (weak, nonatomic) IBOutlet UILabel *qFriend;
@property (weak, nonatomic) IBOutlet UILabel *luckNum;
@property (weak, nonatomic) IBOutlet UILabel *love;
@property (weak, nonatomic) IBOutlet UILabel *heath;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (nonatomic,strong) XJConstellationViewModel *constellationVM;
@property (nonatomic,strong) NSString *d;
@end

@implementation XJConstellationDetailController
-(XJConstellationViewModel *)constellationVM
{
    if (!_constellationVM) {
        _constellationVM = [XJConstellationViewModel new];
    }
    return _constellationVM;
}
- (void)viewDidLoad {
    [self getData];
        [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)getData{
   [self.constellationVM getConstellationWithConsName:self.type type:@"today" completionHandler:^(XJConstellationModel *model, NSError *error) {
       if (error) {
           [self.view showWarning:error.localizedDescription];
       }
       else
       {
           self.d = [self.constellationVM dateTime];
           self.date.text = self.d;
           self.content.text = [self.constellationVM content];
           self.qFriend.text = [self.constellationVM Qfridend];
           self.luckNum.text = [NSString stringWithFormat:@"%ld",[self.constellationVM luckyNumber]];
           self.love.text = [self.constellationVM love];
           self.heath.text = [self.constellationVM health];
           self.effiency.text = [self.constellationVM workEfficiency];
           self.totalLucky.text = [self.constellationVM totalLucky];
          // NSLog(@"...%@",self.constellationVM.model);
       }
   }];
   
}
- (IBAction)backClick:(id)sender {
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
