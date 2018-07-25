//
//  ViewController.m
//  UITableView的一个小demo
//
//  Created by space on 2018/6/22.
//  Copyright © 2018 space. All rights reserved.
//

#import "UITableController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *saintArray;
    UITableView *tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1 path 2 加载文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"saint.plist" ofType:nil];
    saintArray = [NSArray arrayWithContentsOfFile:path];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 414, 600)];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return saintArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *subArray = [saintArray objectAtIndex:section];
    return subArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",(long)indexPath.row);
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    static NSString *cellID = @"space";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//        NSLog(@"当前cell不可用 %d", indexPath.row);
    }
    
    NSArray *subArray = [saintArray objectAtIndex:indexPath.section];
    
    NSDictionary *dic = [subArray objectAtIndex:indexPath.row];
    NSString *name = [dic valueForKey:@"name"];
    NSString *image = [dic valueForKey:@"image"];
    NSString *detail = [dic valueForKey:@"detail"];
    
    cell.textLabel.text = name;
    cell.imageView.image = [UIImage imageNamed:image];
    cell.detailTextLabel.text = detail;
    
    cell.detailTextLabel.textColor = [UIColor grayColor];
    
//    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.image = [UIImage imageNamed:@"cellbg"];
//    cell.backgroundView = imageView;

//    UIView *uiView = [[UIView alloc] init];
//    uiView.backgroundColor = [UIColor blueColor];
//    cell.backgroundView = uiView;

    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return @"战斗力 800～1000";
    } else {
        return @"战斗力 1000～2222";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"雅典娜";
    } else {
        return @"圣斗士";
    }
}


@end
