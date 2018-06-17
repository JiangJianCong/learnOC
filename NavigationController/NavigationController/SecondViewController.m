//
//  SecondViewController.m
//  NavigationController
//
//  Created by space on 2018/6/17.
//  Copyright © 2018 space. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Sencond2";
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *bt1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 60)];
    [bt1 setTitle:@"Pop" forState:UIControlStateNormal];
    [bt1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt1];
}

-(void) buttonAction1 {
    // 返回根试图控制器
//    [self.navigationController popToRootViewControllerAnimated:true];
    // viewController : NSArray
//    NSArray *array_vc = self.navigationController.viewControllers;
//    for (UIViewController *item in array_vc) {
//        if (item.view.tag == 10000) {
//            // pop到指定视图控制器
//            [self.navigationController popToViewController:item animated:true];
//        }
//    }
    
    UIViewController *topVC = self.navigationController.topViewController;
    topVC.view.backgroundColor = [UIColor blueColor];
    
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
