//
//  ViewController.m
//  自定义cell
//
//  Created by space on 2018/7/25.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableview;
    NSArray *dataSource;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = @[@"safari",@"photo"];
    
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 414, 600)];
    [self.view addSubview:tableview];
    
    tableview.dataSource = self;
    tableview.delegate = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *image = [dataSource objectAtIndex:indexPath.row];
    TableViewCell *cell = [TableViewCell createCellWithTableView:tableview];
    [cell loadData:image label:image];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
