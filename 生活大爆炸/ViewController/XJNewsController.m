//
//  XJNewsController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJNewsController.h"
#import "XJNetManager.h"
#import "XJNewsViewModel.h"

@interface XJNewsController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong ) UITableView *tableView;
@property (nonatomic, strong)XJNewsViewModel *newsVM;
@end

@implementation XJNewsController

-(XJNewsViewModel *)newsVM
{
    if (!_newsVM) {
        _newsVM = [XJNewsViewModel new];
    }
    return _newsVM;
}

-(void)createTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:SCREEN_FRAME style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
- (void)viewDidLoad {
    [self createTableView];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.newsVM getNewsWithCategory:nil requestMode:RequestModeRefresh completionHandler:^(NSError *error) {
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
        [weakSelf.newsVM getNewsWithCategory:nil requestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            }else{
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endFooterRefresh];
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
    return self.newsVM.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [self.newsVM newsForIndex:indexPath.row];
    return cell;
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
