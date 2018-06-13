//
//  ViewController.m
//  Stage2-UISearchBar
//
//  Created by space on 2018/6/13.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate> {
    NSArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self searchBar1];
    [self searchBar2];
}


/**
 自定义UISearchBar
 */
-(void) searchBar2 {
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 414, 50)];
    searchBar.showsCancelButton = true;
    searchBar.showsBookmarkButton = true; // 标签
    searchBar.delegate = self;
    searchBar.backgroundImage = [UIImage imageNamed:@"searchbarbg.png"];
    
    [searchBar setImage:[UIImage imageNamed:@"bookmarkicon.png"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    [searchBar setImage:[UIImage imageNamed:@"bookmarkiconhighlighted.png"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    [self.view addSubview:searchBar];
}

-(void)searchBar1 {
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 414, 50)];
    searchBar.showsCancelButton = true;
    searchBar.delegate = self;
    
    //    补充属性
    searchBar.showsScopeBar = true;
    array = @[@"a",@"b"];
    searchBar.scopeButtonTitles = array;
    
    
    [self.view addSubview:searchBar];
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    NSLog(@"%ld",(long)selectedScope);
    NSLog(@"array=%@",[array objectAtIndex:selectedScope]);
}


/**
 取消的回调方法

 @param searchBar 某个searchBar
 */
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Hello");
    [searchBar resignFirstResponder]; // 键盘取消
}

// 搜索需要查询的内容
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%@",searchBar.text);
    [searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
