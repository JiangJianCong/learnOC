//
//  SpaceBaseViewController.m
//  PhotoProject
//
//  Created by space on 2018/8/16.
//  Copyright © 2018 space. All rights reserved.
//

#import "SpaceBaseViewController.h"

@interface SpaceBaseViewController ()

@end

@implementation SpaceBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
    
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
