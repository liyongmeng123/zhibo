//
//  ViewController.m
//  zhibo
//
//  Created by 李勇猛 on 2017/11/18.
//  Copyright © 2017年 李勇猛. All rights reserved.
//

#import "ViewController.h"
#import "LYMAnchorListViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface ViewController ()

@property (nonatomic,strong)NSMutableArray * dataArray;
@property (weak, nonatomic) IBOutlet UIButton *listButton;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSURLSessionDataTask * task =[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1"]     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSDictionary * dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        
//        NSLog(@"%@",dic[@"lives"]);
//    }];
//    
//    [task resume];
}


- (IBAction)listButtonEvent:(id)sender {
    
    LYMAnchorListViewController * vc = [[LYMAnchorListViewController alloc]init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}


@end
