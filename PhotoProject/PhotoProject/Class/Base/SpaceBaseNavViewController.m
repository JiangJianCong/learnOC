//
//  SpaceBaseNavViewController.m
//  PhotoProject
//
//  Created by space on 2018/8/18.
//  Copyright © 2018 space. All rights reserved.
//

#import "SpaceBaseNavViewController.h"

@interface SpaceBaseNavViewController ()

@end

@implementation SpaceBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = RGB(0, 216, 201);
    self.navigationBar.tintColor = [UIColor whiteColor];
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
