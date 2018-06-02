//
//  ViewController.m
//  Quartz2d1
//
//  Created by space on 2018/6/2.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"
#import "Quartz.h"

@interface ViewController (){
    Quartz *quartz2d;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    quartz2d = [[Quartz alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:quartz2d];
    [quartz2d setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
