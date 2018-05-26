//
//  ViewController.m
//  UIButton
//
//  Created by space on 2018/5/26.
//  Copyright © 2018年 space. All rights reserved.
//

//  自定义button的核心思想：确定image+title
//  1、定义UIButton   2、init  3、image  4、调用

#import "ViewController.h"
#import "Mybutton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *myButton;

- (IBAction)myAction:(id)sender;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self button1];
    [self button2];
    [self button3];
    [self button4];
    [self button5];
    [self button6];
}


/**
 自定义button
 */
-(void) button6 {
    Mybutton *button = [[Mybutton alloc] initWithFrame:CGRectMake(50, 400, 120, 50)];
//    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
}


/**
 边框
 */
-(void) button5 {
    // UI组件使用3步，1、UI实例化 2、UI属性   3、 UIView添加到父空间上
    // UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 320, 100, 60)];
    
    // 使用类型的type
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.frame = CGRectMake(50, 320, 100, 60);
    
    
    // 为button添加内容 1、title 2、状态
    [button setTitle:@"Button5" forState:UIControlStateNormal];
    
    // 为button内容设置相应颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    button.layer.borderColor = [UIColor blueColor].CGColor;
    button.layer.borderWidth = 2.0;
    button.layer.cornerRadius = 10.0;
    
    // 作用：添加响应方法 1、self 2、@selector(方法名) 3、UIControlEventTouchUpInside : 点击之后
    // UIControlEventTouchDown 按下就响应
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
}


/**
 UIButton 的枚举类型
 枚举：状态枚举
 */
-(void) button4 {
    // UI组件使用3步，1、UI实例化 2、UI属性   3、 UIView添加到父空间上
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 60)];
    
    // 为button添加内容 1、title 2、状态
    [button setTitle:@"Button5" forState:UIControlStateNormal];
    
    // 为button内容设置相应颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    // 作用：添加响应方法 1、self 2、@selector(方法名) 3、UIControlEventTouchUpInside : 点击之后
    // UIControlEventTouchDown 按下就响应
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
}


/**
 修改背景图片,添加背景颜色
 */
-(void)button3 {
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 180, 100, 60)];
    [button1 setTitle:@"Button3" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    // 颜色,分两种,字体颜色和背景颜色 是不一样的
    // 默认情况下，颜色为白色
    // button1.backgroundColor = [UIColor grayColor];
    
    // 背景图片设置 1、加载图片   2、加载状态
    [button1 setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    
    [button1 setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:button1];
    
}

/**
 button2的函数,添加相应方法
 */
-(void) button2 {
    // UI组件使用3步，1、UI实例化 2、UI属性   3、 UIView添加到父空间上
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 110, 100, 60)];
    
    // 为button添加内容 1、title 2、状态
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    
    // 为button内容设置相应颜色
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    // 作用：添加响应方法 1、self 2、@selector(方法名) 3、UIControlEventTouchUpInside : 点击之后
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
}

/**
 button2的点击时间
 */
-(void) buttonAction :(UIButton*)bt {
    NSLog(@"我被点击了");
    bt.backgroundColor = [UIColor redColor];
    self.myButton.backgroundColor = [UIColor redColor];
}

/**
 button1的函数
 */
-(void) button1 {
    // UI组件使用3步，1、UI实例化 2、UI属性   3、 UIView添加到父空间上
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 60)];

    // 为button添加内容 1、title 2、状态
    [button1 setTitle:@"Button1" forState:UIControlStateNormal];
    
    // 为button内容设置相应颜色
    [button1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    [self.view addSubview:button1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)myAction:(id)sender {
    UIButton *bt = (UIButton*) sender;
    bt.backgroundColor = [UIColor greenColor];
}
@end
