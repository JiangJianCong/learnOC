//
//  ViewController.m
//  TableViewDemo
//
//  Created by space on 2018/7/21.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *saintArray;
    UITableView *tableView;
    NSMutableArray *indexArray;
}
- (IBAction)reloadAllData:(id)sender;
- (IBAction)reloadOne:(id)sender;
- (IBAction)edit:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1 path 2 加载文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"saint.plist" ofType:nil];
//    saintArray = [NSMutableArray arrayWithContentsOfFile:path];
    saintArray = [[NSMutableArray alloc]initWithArray:[NSArray arrayWithContentsOfFile:path]];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 414, 600)];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    indexArray = [[NSMutableArray alloc]init];
    
    for (NSArray *item in saintArray) {
//        NSString *name = [item valueForKey:@"name"];
        
//        [indexArray addObject:name];
        for (NSDictionary *dic in item) {
            NSString *name = [dic valueForKey:@"name"];
            [indexArray addObject:name];
        }
        
    }
}

// 右侧索引条
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return indexArray;
}
// 
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    [tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:true];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return index;
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
    return 30;
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


- (IBAction)reloadAllData:(id)sender {
}

- (IBAction)reloadOne:(id)sender {
}

- (IBAction)edit:(id)sender {
    tableView.editing = true;
}

// 编辑
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *dataArray = [saintArray objectAtIndex: indexPath.section];
    NSMutableArray *dataMutArray = [[NSMutableArray alloc]initWithArray:dataArray];
    [dataMutArray removeObjectAtIndex:indexPath.row];
    // 刷新数据
    [saintArray replaceObjectAtIndex:indexPath.section withObject:dataMutArray];
    [tableView reloadData];
}

// 选择,数据提交，页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *dataArray = [saintArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [dataArray objectAtIndex:indexPath.row];
    NSString *name = [dic valueForKey:@"name"];
    NSString *detail = [dic valueForKey:@"detail"];
    NSLog(@"name:%@ detail:%@",name,detail);
}

@end
