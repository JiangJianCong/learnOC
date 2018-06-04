//
//  ViewController.m
//  图形上下文栈
//
//  Created by space on 2018/6/4.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"
#import "QuartzGra.h"
#import "UIView+ScreenView.h"
@interface ViewController (){
    QuartzGra *quartz;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    quartz = [[QuartzGra alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:quartz];
//    [quartz setNeedsDisplay];
    
    
    // 截屏
    UIImage *image = [self.view imageScreenShot];
    // 保存到本地相册
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
