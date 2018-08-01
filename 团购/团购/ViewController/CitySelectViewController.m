//
//  CitySelectViewController.m
//  团购
//
//  Created by space on 2018/7/28.
//  Copyright © 2018 space. All rights reserved.
//

#import "CitySelectViewController.h"
#import "Util.h"
#import "MyDataSource.h"

@interface CitySelectViewController () <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *indexArray;
    NSArray *cityArray;
    UITableView *tableView;
}

@end

@implementation CitySelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"city.plist" ofType:nil];
    cityArray = [NSArray arrayWithContentsOfFile:path];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, SCREEN_HEIGHT-30)];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    indexArray = [[NSMutableArray alloc] init];
    for (NSArray *array in cityArray) {
        NSDictionary *dic = [array firstObject];
        NSString *cityLetter = [dic valueForKey:@"cityLetter"];
        [indexArray addObject:cityLetter];
    }
    
    UIView *view_tbHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90)];
    UILabel *lab_hotCity = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-20, 5)];
    lab_hotCity.text = @"---热门城市---";
    lab_hotCity.font = [UIFont systemFontOfSize:12.0];
    lab_hotCity.textAlignment = NSTextAlignmentLeft;
    [view_tbHead addSubview:lab_hotCity];
    
    NSArray *array_hotCity = @[@"北京",@"上海",@"深圳",@"杭州",@"武汉",@"广州"];
    for (int i = 0; i < 6 ; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20+(i%3)*(SCREEN_WIDTH/3-10), (i/3)*40+15, SCREEN_WIDTH/3 - 20, 35)];
        NSString *cityName = [array_hotCity objectAtIndex:i];
        label.text = cityName;
        label.font = [UIFont systemFontOfSize:18.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        [view_tbHead addSubview:label];
    }
    tableView.tableHeaderView = view_tbHead;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return cityArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *item = [cityArray objectAtIndex:section];
    return item.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"space.tuangou.tb";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    NSArray *array = [cityArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    NSString *cityName = [dic valueForKey:@"cityName"];
    cell.textLabel.text = cityName;
    return cell;
}

// 分组
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *str = [indexArray objectAtIndex:section];
    return str;
}

// 右侧索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return indexArray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [cityArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    NSString *str = [dic valueForKey:@"cityName"];
    [[MyDataSource getInstance] setCityName:str];
    [self.navigationController popViewControllerAnimated:true];
    
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
