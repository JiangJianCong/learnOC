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


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 登录按钮
    UIImage *image = [UIImage imageNamed:@"login.png"];
    UIImage *newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *bbi_login = [[UIBarButtonItem alloc] initWithImage:newImage style:UIBarButtonItemStyleDone target:self action:@selector(loginAction)];
    
    self.navigationItem.leftBarButtonItem = bbi_login;
    
    // 2 2.1 坐标 2.2 navigationItem
    
    UIButton *bt_qrcode = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 44, 44)];
    [bt_qrcode setImage: [UIImage imageNamed:@"qr_code.png"] forState:UIControlStateNormal];
    [bt_qrcode addTarget:self action:@selector(qrcodeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:bt_qrcode];
    
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
    CitySelectedButton *bt_selectCity = [[CitySelectedButton alloc]initWithFrame:CGRectMake(0, 0, 65, 44)];
    [bt_selectCity addTarget:self action:@selector(selectCityAction) forControlEvents:UIControlEventTouchUpInside];
    [bt_selectCity setTitle:@"北京" forState:UIControlStateNormal];
    [bt_selectCity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt_selectCity setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    
    UIBarButtonItem *bbi_selectCity = [[UIBarButtonItem alloc]initWithCustomView:bt_selectCity];
    self.navigationItem.rightBarButtonItem = bbi_selectCity;
    
    
}

-(void)selectCityAction {
    
}

-(void)loginAction {
    
}

-(void)qrcodeAction {
    
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
