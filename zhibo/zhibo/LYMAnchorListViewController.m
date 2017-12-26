//
//  LYMAnchorListViewController.m
//  zhibo
//
//  Created by 李勇猛 on 2017/12/2.
//  Copyright © 2017年 李勇猛. All rights reserved.
//

#import "LYMAnchorListViewController.h"
#import "LYMListItem.h"
#import "LYMCreatorItem.h"
#import "AFNetworking.h"
#import "YYmodel.h"

@interface LYMAnchorListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSArray * dataArray;
@end

static NSString *ID =@"cell";
@implementation LYMAnchorListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView =[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    manger.responseSerializer =[AFJSONResponseSerializer serializer];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];

    [manger GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        _dataArray = [NSArray yy_modelArrayWithClass:[LYMListItem class]json:responseObject[@"lives"]];
        [self.tableView reloadData];
        
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell ==nil) {
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    LYMListItem * item =_dataArray[indexPath.row];
    cell.textLabel.text =item.creator.portrait;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;

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
