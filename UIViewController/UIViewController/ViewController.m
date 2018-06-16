//
//  ViewController.m
//  UIViewController
//
//  Created by space on 2018/6/16.
//  Copyright © 2018 space. All rights reserved.
//
// 1 UIView 展示颜色 视图
// 2 Array 展示颜色 数据 model
// 3 Controller 控制
// MVC结构

#import "ViewController.h"

@interface ViewController () {
    UIView *view;
    NSArray *array_color;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    [self.view addSubview:view];
//
//    array_color = [[NSArray alloc] initWithObjects:[UIColor colorWithRed:255.0/255.0 green:127.0/255.9 blue:29/255.0 alpha:1.0],[UIColor colorWithRed:255.0/255.0 green:138/255.9 blue:216/255.0 alpha:1.0],[UIColor colorWithRed:216.0/255.0 green:88.0/255.9 blue:29/255.0 alpha:1.0], [UIColor colorWithRed:55.0/255.0 green:57.0/255.9 blue:132/255.0 alpha:1.0],nil];
    
    
    // 联网状态
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = true;
    
}

// 点击回调 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    int index = arc4random() % 3;
//    UIColor *color = [array_color objectAtIndex:index];
//    view.backgroundColor = color;

    
    /*
    //    拿到当前单例对象;
    UIApplication *app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber = 100;
    */

    UIApplication *app = [UIApplication sharedApplication];
    app.statusBarStyle = UIStatusBarStyleDefault;
    
}
// 重写方法：隐藏当前状态栏
-(BOOL)prefersStatusBarHidden {
    return false;
}

// 状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}




@end
