//
//  XJJokeController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/28.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJJokeController.h"
#import "XJJokeViewModel.h"
#import "XJNetManager.h"
#import "XJJokeCell.h"
@interface XJJokeController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong ) UITableView *tableView;
@property (nonatomic, strong)XJJokeViewModel *jokeVM;
@property (nonatomic,assign) NSInteger count;
@property(nonatomic,strong) NSMutableArray *datas;

@end

@implementation XJJokeController
static int num = 0;
-(XJJokeViewModel *)jokeVM
{
    if (!_jokeVM) {
        _jokeVM = [XJJokeViewModel new];
    }
    return _jokeVM;
}
-(NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
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
    // 期望高度 预估高度
    self.tableView.estimatedRowHeight = 60;
    // 适应自动布局 行高自适应
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.jokeVM getJokeWithCategory:nil requestMode:RequestModeRefresh completionHandler:^(NSError *error) {
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
        //在宏中使用\可以达到换行的效果
        
        [weakSelf.jokeVM getJokeWithCategory:nil requestMode:RequestModeMore completionHandler:^(NSError *error) {
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
    return self.jokeVM.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJJokeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jokeCell" forIndexPath:indexPath];
    cell.count.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
    cell.content.text = [self.jokeVM jokeForIndex:indexPath.row];
    cell.timeLabel.text = [self.jokeVM createTimeForIndex:indexPath.row];
    cell.collection.tag = indexPath.row * 100;
    [cell.collection addTarget:self action:@selector(collection:) forControlEvents:UIControlEventTouchUpInside];
    //[cell.collection addTarget:self action:@selector(collectionText:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)collection:(UIButton *)sender
{
    num ++;
    if (num%2==0) {
    [sender setTitle:@"收藏" forState:UIControlStateNormal];
    
    }
    else
    {
    [sender setTitle:@"已收藏" forState:UIControlStateNormal];
        //文件路径
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"joke.data"];
        NSLog(@"%@",filePath);
        [self.datas insertObject:[self.jokeVM jokeForIndex:sender.tag/100] atIndex:0];
        //归档
        [NSKeyedArchiver archiveRootObject:self.datas toFile:filePath];
    }
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
