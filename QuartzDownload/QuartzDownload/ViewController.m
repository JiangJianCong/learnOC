//
//  ViewController.m
//  QuartzDownload
//
//  Created by space on 2018/6/4.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"
#import "QuartzDL.h"
@interface ViewController (){
    QuartzDL *quartzView;
    int i;
    UILabel *lab;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 200, 414-40, 14)];
    view.backgroundColor = COLOR2;
    view.layer.cornerRadius = 7.0;
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view, typically from a nib.
    lab = [[UILabel alloc]initWithFrame:CGRectMake(414-120, 170, 100, 20)];
    lab.text = @"0.0%";
    lab.textColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:lab];
    
    
    quartzView = [[QuartzDL alloc]initWithFrame:self.view.frame];
    quartzView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:quartzView];
    
    // 定时器
    i = 0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(loadRefush) userInfo:nil repeats:true];
    
    
    
    
}
-(void)loadRefush {
    if (i < 100) {
        i++;
    } else {
        i = 100;
    }
    quartzView.percent = i;
    lab.text =[ NSString stringWithFormat:@"%d%@",i,@"%"];
    [quartzView setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
