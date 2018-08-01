//
//  WebViewController.m
//  团购
//
//  Created by space on 2018/8/1.
//  Copyright © 2018 space. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () {
    UIWebView *webView;
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:webView];
//    NSString *url = @"http://www.baidu.com";
//    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString:url]];
//    [webView loadRequest:request];
    
    // 打开浏览器
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.baidu.com"] options:nil completionHandler:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
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
