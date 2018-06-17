//
//  ViewController.m
//  NavigationController
//
//  Created by space on 2018/6/17.
//  Copyright © 2018 space. All rights reserved.
//
// 1 每次页面：单独视图控制器
// 2 UINavigationController = 导航 + 视图控制器 = 导航 + UIView + controller
// 3 push 输入
// 4 pop 输出
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface ViewController () {
    FirstViewController *firstVC;
    SecondViewController *second2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 属性: 1 title
    // 2 navigationItem：导航栏;
    // 3 titleView : x,y坐标不起作用
    // 4 UIButton
    //    self.navigationItem.title = @"Main";
    //    self.title = @"Main1"; // 同样
    //        self.navigationItem.titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    //        self.navigationItem.titleView.backgroundColor = [UIColor redColor];
    //
    //    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    //    [bt setTitle:@"color" forState:UIControlStateNormal];
    //    [bt addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    //    [self.navigationItem.titleView addSubview:bt];
    
    
    self.navigationItem.title = @"Main0";
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = item;
    // 导航栏颜色 : 半透明 有颜色梯度
//    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    
    // color 导航栏的颜色 ： 正
//    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    
    // UIBarButtonItem颜色
//    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    
    NSDictionary *colorDic = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor greenColor],NSForegroundColorAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = colorDic;
    
    
    
    // push 0->1
    // push 0->2
    // push 1->2
    // pop 1-> 0
    UIButton *bt1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 60)];
    [bt1 setTitle:@"Push" forState:UIControlStateNormal];
    [bt1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt1];
    
    
    UIButton *bt2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 60)];
    [bt2 setTitle:@"Push0_2" forState:UIControlStateNormal];
    [bt2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt2];
    
    self.view.tag = 10000;
    
    // 工具栏
    [self.navigationController setToolbarHidden:false];
//    [self.navigationController setNavigationBarHidden:true];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction1)];
    
    
    // 间隔 UIBarButtonSystemItemFixedSpace 宽度50
    UIBarButtonItem *barButtonItem4 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    barButtonItem4.width = 50;
    
    
    NSArray *items = [[NSArray alloc]initWithObjects:barButtonItem,barButtonItem4,barButtonItem,barButtonItem, nil];
    [self setToolbarItems:items];
}

-(void) buttonAction2 {
    if (second2 == nil) {
        second2 = [[SecondViewController alloc]init];
    }
    [self.navigationController pushViewController:second2 animated:true];
}

-(void)buttonAction1 {
    if (firstVC == nil) {
        firstVC = [[FirstViewController alloc]init];
    }
    // function ： push出一个新的视图控制器，animated ：动画效果
    [self.navigationController pushViewController:firstVC animated:true];
    
}

-(void)buttonAction {
    self.view.backgroundColor = [UIColor grayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
