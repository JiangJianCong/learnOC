//
//  ViewController.m
//  LoginOut
//
//  Created by space on 2018/6/16.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"
#import "LogoutViewController.h"

@interface ViewController () {
    LogoutViewController *vc;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 60)];
    [bt setTitle:@"登陆" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}
-(void) buttonAction {
    vc = [[LogoutViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
