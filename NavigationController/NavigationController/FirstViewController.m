//
//  FirstViewController.m
//  NavigationController
//
//  Created by space on 2018/6/17.
//  Copyright © 2018 space. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController () {
    SecondViewController *second2;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"First1";
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *bt1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 60)];
    [bt1 setTitle:@"Push1" forState:UIControlStateNormal];
    [bt1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt1];
    
    UIButton *bt2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 60)];
    [bt2 setTitle:@"Pop" forState:UIControlStateNormal];
    [bt2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt2];
    
    
    
    // UIBarButtonItem
    // 1 样式 2 响应对象 3 action  4初始化
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(buttonAction2)];

//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction2)];

//     根据自定义view来添加UIBarButtonItem
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    view.backgroundColor = [UIColor redColor];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    
//    // 根据图片添加 主要渲染部分
//    UIImage *image = [UIImage imageNamed:@"1.jpg"];
//    // UIImage -> UIBarButtonItem 渲染
//    UIImage *newImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithImage:newImage style:UIBarButtonItemStyleDone target:self action:@selector(buttonAction2)];
    
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
}
-(void)buttonAction2 {
    // 从哪个地方来 回哪里去
    [self.navigationController popViewControllerAnimated:true];
}


-(void)buttonAction1 {
    if (second2 == nil) {
        second2 = [[SecondViewController alloc]init];
    }
    [self.navigationController pushViewController:second2 animated:true];
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
