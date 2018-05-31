//
//  MyViewToAlertView.m
//  UIAlertView
//
//  Created by space on 2018/5/31.
//  Copyright © 2018年 space. All rights reserved.
//

#import "MyViewToAlertView.h"

@implementation MyViewToAlertView
-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.8;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 50)];
        label.text = @"自定义label";
        label.textAlignment = NSTextAlignmentCenter;
    
        [self addSubview:label];
        
        UIButton *bt_ok = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width/2, 40)];
        bt_ok.tag = 200;
        [bt_ok setTitle:@"ok" forState:UIControlStateNormal];
        bt_ok.layer.borderColor = [UIColor blueColor].CGColor;
        bt_ok.layer.borderWidth = 1.0;
        [bt_ok addTarget:self action:@selector(alertAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt_ok];
        
        UIButton *bt_cancel = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height-40, self.frame.size.width/2, 40)];
        bt_cancel.tag = 201;
        [bt_cancel setTitle:@"cancel" forState:UIControlStateNormal];
        bt_cancel.layer.borderColor = [UIColor blueColor].CGColor;
        bt_cancel.layer.borderWidth = 1.0;
        [bt_cancel addTarget:self action:@selector(alertAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt_cancel];
        
    }
    return self;
}
-(void) alertAction:(UIButton*) bt {
    // 区分bt
    
    // 隐藏动画，alpha变0 就是隐藏
    if (bt.tag == 200) {
        
        // ok按钮
        NSLog(@"ok");
    } else if (bt.tag == 201){
        NSLog(@"cancel");
    }
    self.alpha = 0;
}

@end
