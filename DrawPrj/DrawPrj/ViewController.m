//
//  ViewController.m
//  DrawPrj
//
//  Created by space on 2018/6/9.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"
#import "UnBlockView.h"
#import "FunctionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UnBlockView *blockView = [[UnBlockView alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:blockView];
    blockView.unblockViewBlock = ^(UnBlockView *bView, BOOL success) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:success?@"解锁成功":@"解锁失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [bView reset];
            if (success) {
                // 跳转到新的页面
                FunctionViewController *vc = [[FunctionViewController alloc] init];
                [self presentViewController:vc animated:YES completion:nil];
            }
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
