//
//  LogoutViewController.m
//  LoginOut
//
//  Created by space on 2018/6/16.
//  Copyright © 2018 space. All rights reserved.
//

#import "LogoutViewController.h"
#import "AppDelegate.h"

@interface LogoutViewController ()

@end

@implementation LogoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 60)];
    [bt setTitle:@"注销" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
}

-(void) buttonAction {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    
    app.window.rootViewController = vc;
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
