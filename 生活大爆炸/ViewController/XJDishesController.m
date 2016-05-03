//
//  XJDishesController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishesController.h"
#import "XJNetManager.h"
#import "XJDishViewModel.h"
#import "XJDishCell.h"
#import "UIImageView+WebCache.h"
#import "XJDishDetailController.h"
@interface XJDishesController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong ) UITableView *tableView;
@property (nonatomic, strong)XJDishViewModel *dishVM;
@end

@implementation XJDishesController
-(XJDishViewModel *)dishVM
{
    if (!_dishVM) {
        _dishVM = [XJDishViewModel new];
    }
    return _dishVM;
}
-(void)createTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:SCREEN_FRAME style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"XJDishCell" bundle:nil] forCellReuseIdentifier:@"dishCell"];
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [self createTableView];
    UIButton *backButton =[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT-60, 50, 50)];
    [backButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
    // 期望高度 预估高度
    self.tableView.estimatedRowHeight = 60;
    // 适应自动布局 行高自适应
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.dishVM getDishDataWithDishName:weakSelf.dishName requestMode:RequestModeRefresh CompletionHandler:^(XJDishModel *model, NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            }else{
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addBackFooterRefresh:^{
        [weakSelf.dishVM getDishDataWithDishName:weakSelf.dishName requestMode:RequestModeMore CompletionHandler:^(XJDishModel *model, NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            }else{
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
  

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dishVM.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJDishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dishCell" forIndexPath:indexPath];
    [cell.albumView sd_setImageWithURL:[NSURL URLWithString:[self.dishVM urlForIndex:indexPath.row]]];
    cell.tagsLabel.text = [self.dishVM tagsForIndex:indexPath.row];
    cell.introLabel.text = [self.dishVM introduceForIndex:indexPath.row];
    cell.ingredientsLabel.text = [self.dishVM ingredientsForIndex:indexPath.row];
    cell.titleLabel.text = [self.dishVM nameForIndex:indexPath.row];
    cell.burden.text = [self.dishVM burdenForIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJDishDetailController *vc = [XJDishDetailController new];
    vc.CID = [self.dishVM cidForIndex:indexPath.row];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
