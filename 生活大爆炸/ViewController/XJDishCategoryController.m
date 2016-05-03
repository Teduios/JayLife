//
//  XJDishCategoryController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJDishCategoryController.h"
#import "XJNetManager.h"
#import "XJDishCategoryViewModel.h"
#import "XJDishesController.h"
@interface XJDishCategoryController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong ) UITableView *tableView;
@property (nonatomic, strong)XJDishCategoryViewModel *dcVM;
@end

@implementation XJDishCategoryController

-(XJDishCategoryViewModel *)dcVM
{
    if (!_dcVM) {
        _dcVM = [XJDishCategoryViewModel new];
    }
    return _dcVM;
}
-(void)createTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:SCREEN_FRAME style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"XJJokeCell" bundle:nil] forCellReuseIdentifier:@"jokeCell"];
    [self.view addSubview:_tableView];
}
- (void)viewDidLoad {
    [self createTableView];
    [self.dcVM getDishNameCompletionHandler:^(XJDishCategoryModel *model, NSError *error) {
        if (error) {
            [self.view showWarning:error.localizedDescription];
        }else{
            [self.tableView reloadData];
        }
    }];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dcVM.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [self.dcVM dishNameForIndex:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SCREEN_HEIGHT/11;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJDishesController *dish = [XJDishesController new];
    dish.dishName = [self.dcVM dishNameForIndex:indexPath.row];
    [self presentViewController:dish animated:YES completion:nil];
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
