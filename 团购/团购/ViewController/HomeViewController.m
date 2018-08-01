//
//  HomeViewController.m
//  团购
//
//  Created by space on 2018/7/27.
//  Copyright © 2018 space. All rights reserved.
//

#import "HomeViewController.h"
#import "Util.h"
#import "CitySelectedButton.h"
#import "LoginViewController.h"
#import "CitySelectViewController.h"
#import "MyDataSource.h"
#import "ClassButton.h"
#import "ProductDataSource.h"
#import "ProductTableViewCell.h"
#import "ItemViewController.h"
#import "BusinessViewController.h"


@interface HomeViewController () <UITableViewDelegate,UITableViewDataSource>{
    LoginViewController *vc_login;
    CitySelectViewController *vc_citySelect;
    CitySelectedButton *bt_selectCity;
    NSMutableArray *productArray;
    UITableView *tableview_product;
    ItemViewController *itemVC;
    BusinessViewController *subClassVC;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateSimulateData];
    
    // 登录按钮
    UIImage *image = [UIImage imageNamed:@"login.png"];
    UIImage *newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *bbi_login = [[UIBarButtonItem alloc] initWithImage:newImage style:UIBarButtonItemStyleDone target:self action:@selector(loginAction)];
    
    self.navigationItem.leftBarButtonItem = bbi_login;
    
    /*
    // 2 2.1 坐标 2.2 navigationItem
    
    UIButton *bt_qrcode = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 44, 44)];
    [bt_qrcode setImage: [UIImage imageNamed:@"qr_code.png"] forState:UIControlStateNormal];
    [bt_qrcode addTarget:self action:@selector(qrcodeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:bt_qrcode];
    
     */
    image = [UIImage imageNamed:@"qr_code.png"];
    UIImage *qrImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *bt_QRCode = [[UIBarButtonItem alloc] initWithImage:qrImage style:UIBarButtonItemStyleDone target:self action:@selector(qrcodeAction)];
    NSArray *bt_array = [[NSArray alloc] initWithObjects:bbi_login,bt_QRCode, nil];
    self.navigationItem.leftBarButtonItems = bt_array;
    
    // 3 搜索
    UITextField *tf_search = [[UITextField alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH-100-100 , 25)];
    tf_search.backgroundColor = [UIColor whiteColor];
    tf_search.borderStyle = UITextBorderStyleNone;
    tf_search.layer.borderColor = [UIColor whiteColor].CGColor;
    tf_search.layer.cornerRadius = 12.5;
    
    // 3.1 leftView 3.2 PS 3.3 自定义 3.4 UIImageView -> UIView -> leftView
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 20, 20)];
    [imageView setImage:[UIImage imageNamed:@"search.png"]];
    [view addSubview:imageView];
    
    tf_search.leftView = view;
    
    tf_search.leftViewMode = UITextFieldViewModeAlways;
    self.navigationItem.titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-100-100, 25)];
    self.navigationItem.titleView.backgroundColor = [UIColor clearColor];
    [self.navigationItem.titleView addSubview:tf_search];
    
    // 4 城市选择列表
    bt_selectCity = [[CitySelectedButton alloc]initWithFrame:CGRectMake(0, 0, 65, 44)];
    [bt_selectCity addTarget:self action:@selector(selectCityAction) forControlEvents:UIControlEventTouchUpInside];
    [bt_selectCity setTitle:@"北京" forState:UIControlStateNormal];
    [bt_selectCity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt_selectCity setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    
    UIBarButtonItem *bbi_selectCity = [[UIBarButtonItem alloc]initWithCustomView:bt_selectCity];
    self.navigationItem.rightBarButtonItem = bbi_selectCity;
    
    NSArray *className = @[@"机票",@"车票",@"汽车",@"蛋糕",@"美食",@"手表",@"电脑",@"手机"];
    for(int i = 0; i< 8;i++) {
        CGRect btRect;
        CGRect imageRect;
        CGRect titleRect;
        if (i < 4) {
            btRect = CGRectMake(i*SCREEN_WIDTH/4, 75, SCREEN_WIDTH/4, 50);
        } else {
            btRect = CGRectMake((i-4)*SCREEN_WIDTH/4, 130, SCREEN_WIDTH/4, 50);
        }
        imageRect = CGRectMake((SCREEN_WIDTH/4-60), 0, 30, 30);
        titleRect = CGRectMake(0, 32, SCREEN_WIDTH/4, 18);
        ClassButton *bt_class = [[ClassButton alloc]initWithFrame:btRect imageFrame:imageRect titleFrame:titleRect];
        NSString *image = [NSString stringWithFormat:@"home_class%d.png",i+1];
        NSString *title = [className objectAtIndex:i];
        [bt_class setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [bt_class setTitle:title forState:UIControlStateNormal];
        [bt_class setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [bt_class addTarget:self action:@selector(classSelectAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bt_class];
    }
    
    // add tableView
    tableview_product = [[UITableView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT-200-44)];
    tableview_product.dataSource = self;
    tableview_product.delegate = self;
    [self.view addSubview:tableview_product];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    label.text = @"---大家都在团---";
    label.textColor = MY_GREENCOLOR;
    tableview_product.tableHeaderView = label;
}

-(void)classSelectAction:(ClassButton*)bt {
    // bt.tag
    subClassVC = [[BusinessViewController alloc]init];
    [self.navigationController pushViewController:subClassVC animated:true];
    
    
}


#pragma mark --UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return productArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductDataSource *product = [productArray objectAtIndex:indexPath.row];
    ProductTableViewCell *cell = [ProductTableViewCell createCellWithTableView:tableView];
    [cell loadData: product];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66.6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductDataSource *itemDataSource = [productArray objectAtIndex:indexPath.row];
    itemVC = [[ItemViewController alloc]init];
    itemVC.itemDataSource = itemDataSource;
    [self.navigationController pushViewController:itemVC animated:true];
}


-(void)selectCityAction {
    if (vc_citySelect == nil) {
        vc_citySelect = [[CitySelectViewController alloc]init];
    }
//    [self presentViewController:vc_citySelect animated:true completion:nil];
    [self.navigationController pushViewController:vc_citySelect animated:true];
}


/**
 Login
 */
-(void)loginAction {
    
    if (vc_login == nil) {
        vc_login = [[LoginViewController alloc]init];
    }
    [self presentViewController:vc_login animated:true completion:nil];
    
}

-(void)qrcodeAction {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    NSString *currentCityName = [[MyDataSource getInstance] getCityName];
    if (currentCityName == nil) {
        [bt_selectCity setTitle:@"北京" forState:UIControlStateNormal];
    } else {
        [bt_selectCity setTitle:currentCityName forState:UIControlStateNormal];
    }
}

#pragma mark -- Model 模拟数据
-(void)generateSimulateData{
    NSArray *productTitle = @[@"牛排",@"地三鲜",@"松仁大虾",@"冷饮",@"牛排",@"地三鲜",@"松仁大虾",@"冷饮",@"牛排",@"地三鲜",@"松仁大虾",@"冷饮"];
    NSArray *productSubTitle1 = @[@"超值单人套餐,10分钟极速配送",@"营养搭配，科学膳食组合。",@"在这里可以尽尝各种美味",@"体验冷热酸甜想吃就是的感觉",@"超值单人套餐,10分钟极速配送",@"营养搭配，科学膳食组合。",@"在这里可以尽尝各种美味",@"体验冷热酸甜想吃就是的感觉",@"超值单人套餐,10分钟极速配送",@"营养搭配，科学膳食组合。",@"在这里可以尽尝各种美味",@"体验冷热酸甜想吃就是的感觉"];
    NSArray *productSubTitle2 = @[@"¥39.9",@"¥99.9",@"¥12",@"¥9.9",@"¥39.9",@"¥99.9",@"¥12",@"¥9.9",@"¥39.9",@"¥99.9",@"¥12",@"¥9.9"];
    NSArray *productSubTitle3 = @[@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢",@"新用户一元抢"];
    NSArray *productSaleNum = @[@"已售:44份",@"已售:20份",@"已售:99份",@"已售:2份",@"已售:44份",@"已售:20份",@"已售:99份",@"已售:2份",@"已售:44份",@"已售:20份",@"已售:99份",@"已售:2份"];
    
    productArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 12; i++) {
        ProductDataSource *dataSource = [[ProductDataSource alloc]init];
        NSString *image = [NSString stringWithFormat:@"product%d.png",i+1];
     
        NSString *title = [productTitle objectAtIndex:i];
        NSString *subTitle1 = [productSubTitle1 objectAtIndex:i];
        NSString *subTitle2 = [productSubTitle2 objectAtIndex:i];
        NSString *subTitle3 = [productSubTitle3 objectAtIndex:i];
        NSString *saleNum = [productSaleNum objectAtIndex:i];
        
        dataSource.image = image;
        dataSource.title = title;
        dataSource.subtitle1 = subTitle1;
        dataSource.subtitle2 = subTitle2;
        dataSource.subtitle3 = subTitle3;
        dataSource.saleNum = saleNum;
        
        [productArray addObject:dataSource];
        
    }
    [[MyDataSource getInstance]setHomeData:productArray];
    
}

@end
