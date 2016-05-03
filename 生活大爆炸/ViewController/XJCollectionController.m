//
//  XJCollectionController.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJCollectionController.h"
#import "XJCollectionCell.h"
@interface XJCollectionController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataList;
@end
@implementation XJCollectionController

-(NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 期望高度 预估高度
    self.tableView.estimatedRowHeight = 60;
    // 适应自动布局 行高自适应
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);

    //文件路径
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"joke.data"];
    //反归档
    NSArray *joke = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    [self.dataList addObjectsFromArray:joke];
        // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentLabel.text = self.dataList[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //如果这里有数据数组， 一定要从数据数组中把 对应的数据也删除掉
        [self.dataList removeObjectAtIndex:indexPath.row];
        
        //点中了删除
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //文件路径
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"joke.data"];
        //归档
        [NSKeyedArchiver archiveRootObject:self.dataList toFile:filePath];
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
