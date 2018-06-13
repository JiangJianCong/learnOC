//
//  ViewController.m
//  Stage2-其他组件
//
//  Created by space on 2018/6/13.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self segmentControl1];
    [self pageControl1];
    
}

-(void)pageControl1 {
    UIPageControl *page = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 160, 414, 20)];
    page.numberOfPages = 10; // 共有多少页
    page.currentPage = 3; // 当前多少页
    page.backgroundColor = [UIColor grayColor];
    [self.view addSubview:page];
    
}

/**
 segmentControl的基本使用
 */
-(void) segmentControl1 {
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[[UIImage imageNamed:@"check.jpg"],[UIImage imageNamed:@"search.jpg"],[UIImage imageNamed:@"tools.png"]]];
    segment.frame = CGRectMake(0, 80, 320, 30);
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
}
-(void)segmentAction:(UISegmentedControl*)msegment {
    NSLog(@"%ld",(long)[msegment selectedSegmentIndex]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
