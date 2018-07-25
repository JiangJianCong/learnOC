//
//  ViewController.m
//  UITableView
//
//  Created by space on 2018/6/22.
//  Copyright © 2018 space. All rights reserved.
//
// 1 UITableView = 表格 + 视图
// 2 UITableView cell N行单列
// 3 滚动 ：UIScrollView


#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 414, 600)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 414, 600)];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    tableView.backgroundView = imageView;
    
    [self.view addSubview:tableView];
    
    // 数据源
    tableView.dataSource = self;
    // 对当前uitableView的控制
    tableView.delegate = self;
    
}

#pragma mark - TableView Delegate
// TableView 分为几个块
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 包含多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"Hello";
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
