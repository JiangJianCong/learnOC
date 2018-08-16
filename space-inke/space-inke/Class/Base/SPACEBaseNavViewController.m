//
//  SPACEBaseNavViewController.m
//  space-inke
//
//  Created by space on 2018/8/2.
//  Copyright © 2018 space. All rights reserved.
//

#import "SPACEBaseNavViewController.h"

@interface SPACEBaseNavViewController ()

@end

@implementation SPACEBaseNavViewController

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
