//
//  ViewController.m
//  UI补充
//
//  Created by space on 2018/5/31.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self slider1];
    [self slider2];
    [self switch1];
    [self pickData];
}

// 自定义的slider
-(void) slider2 {
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 140, 200, 20)];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50.0;
    slider.continuous = true;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *imageLeft = [UIImage imageNamed:@"1.png"];
    UIImage *imageCenter = [UIImage imageNamed:@"3.png"];
    UIImage *imageRight = [UIImage imageNamed:@"2.png"];
    
    UIImage *imageLeftTrace = [imageLeft stretchableImageWithLeftCapWidth:10.0 topCapHeight:0];
    UIImage *imageRightTrace = [imageRight stretchableImageWithLeftCapWidth:10.0 topCapHeight:0];
    
                               
    [slider setMinimumTrackImage:imageLeftTrace forState:UIControlStateNormal];
    [slider setMaximumTrackImage:imageRightTrace forState:UIControlStateNormal];
    [slider setThumbImage:imageCenter forState:UIControlStateNormal];
    
    
    [self.view addSubview:slider];
}
// slider使用
-(void) slider1 {
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50.0;
    slider.continuous = true;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:slider];
}
-(void)sliderAction:(UISlider*) slider {
    NSLog(@"%f",slider.value);
    
    
}

#pragma --Switch
-(void) switch1 {
    UISwitch *mswitch = [[UISwitch alloc]initWithFrame:CGRectMake(20, 200, 50, 25)];
    [mswitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mswitch];
    
}

-(void) switchAction:(UISwitch*) sender {
    NSLog(@"%d",[sender isOn]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma --UIDataPick
-(void)pickData {
    UIDatePicker *dataPicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 250, 320, 100)];
    dataPicker.datePickerMode = UIDatePickerModeDate;
    [dataPicker addTarget:self action:@selector(pickAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:dataPicker];
}

-(void)pickAction:(UIDatePicker*) dataPick {
    NSLog(@"%@",[dataPick date]);
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy...MM...dd";
    NSString *str = [format stringFromDate:[dataPick date]];
    NSLog(@"%@",str);
}

@end
