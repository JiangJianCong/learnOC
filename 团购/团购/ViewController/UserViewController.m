//
//  UserViewController.m
//  团购
//
//  Created by space on 2018/7/27.
//  Copyright © 2018 space. All rights reserved.
//

#import "UserViewController.h"
#import "Util.h"
#import "ClassButton.h"
#import "WebViewController.h"

@interface UserViewController ()<UITableViewDelegate,UITableViewDataSource> {
    NSMutableArray *array1;
    NSMutableArray *array2;
    NSMutableArray *array3;
    NSMutableArray *sourceData;
    UITableView *tableView1;
    WebViewController *webVC;
}

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = true;
    UIView *view_head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    view_head.backgroundColor = MY_GREENCOLOR;
    [self.view addSubview:view_head];
    
    ClassButton *bt_userName = [[ClassButton alloc]initWithFrame:CGRectMake(10, 40, 60, 60) imageFrame:CGRectMake(0, 0, 60, 60) titleFrame:CGRectZero];
    [bt_userName setImage:[UIImage imageNamed:@"userlogin.png"] forState:UIControlStateNormal];
    [view_head addSubview:bt_userName];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(70, 60, 100, 20)];
    lab.text = @"我的账户";
    lab.textColor = [UIColor whiteColor];
    [view_head addSubview:lab];
    
    array1 = [[NSMutableArray alloc]init];
    array2 = [[NSMutableArray alloc]init];
    array3 = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"shopping_cart.png" forKey:@"image"];
    [dic setValue:@"我的商品" forKey:@"title"];
    [array1 addObject:dic];
    
    dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"score.png" forKey:@"image"];
    [dic setValue:@"我的积分" forKey:@"title"];
    [array2 addObject:dic];
    dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"right.png" forKey:@"image"];
    [dic setValue:@"我的特权" forKey:@"title"];
    [array2 addObject:dic];
    
    dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"telsuport.png" forKey:@"image"];
    [dic setValue:@"电话" forKey:@"title"];
    [array3 addObject:dic];
    dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"qqsuport" forKey:@"image"];
    [dic setValue:@"QQ" forKey:@"title"];
    [array3 addObject:dic];
    dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"weixinsupport" forKey:@"image"];
    [dic setValue:@"微信" forKey:@"title"];
    [array3 addObject:dic];
    
    sourceData = [[NSMutableArray alloc]initWithObjects:array1,array2,array3, nil];
    
    tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, SCREEN_HEIGHT-150-44) style:UITableViewStyleGrouped];
    tableView1.dataSource = self;
    tableView1.delegate = self;
    [self.view addSubview:tableView1];
}

#pragma mark --UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sourceData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *subArray = [sourceData objectAtIndex:section];
    return subArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"space.user.tvb.cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    NSArray *subArray = [sourceData objectAtIndex:indexPath.section];
    NSDictionary *dic = [subArray objectAtIndex:indexPath.row];
    NSString *image = [dic valueForKey:@"image"];
    NSString *title = [dic valueForKey:@"title"];
    
    cell.imageView.image = [UIImage imageNamed:image];
    cell.textLabel.text = title;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        webVC = [[WebViewController alloc]init];
        [self.navigationController pushViewController:webVC animated:true];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
