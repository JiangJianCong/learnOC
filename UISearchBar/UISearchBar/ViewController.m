//
//  ViewController.m
//  UISearchBar
//
//  Created by space on 2018/6/13.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self searchBar1];
}


/**
 如何使用searchBar
 */
-(void)searchBar1 {
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 414, 50)];
    searchBar.showsCancelButton = true; // cancel按钮是否显示
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    
    
}


@end
