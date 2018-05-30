//
//  ViewController.m
//  UIViewStudy
//
//  Created by space on 2018/5/23.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myview1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    // 控制view的背景
    self.myview1.backgroundColor = [UIColor brownColor];
    
    // 控制Alpha 范围0～1
//    self.myview1.alpha = 0.5;
    
//    隐藏
//    self.myview1.hidden = true;
    
////  layer ：属性 CGColorRef   在layer下使用颜色要用CDColor
//    self.myview1.layer.borderColor = [UIColor grayColor].CGColor;
//    self.myview1.layer.borderWidth = 10;
//
////    圆角效果
//    self.myview1.layer.cornerRadius = 10;
    
//    阴影效果
    self.myview1.layer.shadowColor = [UIColor greenColor].CGColor;
    self.myview1.layer.shadowOffset = CGSizeMake(10, 10);
    self.myview1.layer.shadowOpacity = 0.5;
    
    // Frame bounds区别？
    // Frame = CGPoint(xy) + CGPoint(wh)
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
//    view.backgroundColor = [UIColor redColor];
    
    // 视图加到主view
    [self.view addSubview:view];
    
    //view2
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(120, 120, 50, 50)];
    view2.backgroundColor = [UIColor greenColor];
    
    // 视图加到主view
    [self.view addSubview:view2];
    
    // 交换视图的位置
//    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(140, 140, 50, 50)];
    view3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view3];
    
    
    view.tag = 1;
    view2.tag = 2;
    view3.tag = 3;
    NSArray *subViewArray = self.view.subviews;
    for (UIView *view in subViewArray) {
        if (view.tag == 1) {
            view.backgroundColor = [UIColor grayColor];
        }
        
        if (view.tag == 2) {
            view.frame = CGRectMake(200, 200, 50, 50);
        }
        
        if (view.tag == 3) {
            [view removeFromSuperview];
        }
    }
    
    
    // 插入到第一个视图之后
//    [self.view insertSubview:view3 atIndex:1];
    
//    CGFloat x = view.bounds.origin.x;
//    CGFloat y = view.bounds.origin.y;
    
    


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginAction:(id)sender {
}

- (IBAction)loginAction:(id)sender {
}
@end
