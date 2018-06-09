//
//  ViewController.m
//  DrawPrj
//
//  Created by space on 2018/6/9.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"
#import "UnBlockView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UnBlockView *blockView = [[UnBlockView alloc]initWithFrame:self.view.frame];
    blockView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:blockView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
