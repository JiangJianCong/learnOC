//
//  ViewController.m
//  Chart2
//
//  Created by space on 2018/6/4.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"
#import "Quartz2d.h"

@interface ViewController (){
    Quartz2d *quartz2d;
}
- (IBAction)reloadAllData:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    quartz2d = [[Quartz2d alloc]initWithFrame:self.view.frame];
    [self.view addSubview:quartz2d];
    [quartz2d setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)reloadAllData:(id)sender {
}
@end
