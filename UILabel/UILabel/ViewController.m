//
//  ViewController.m
//  UILabel
//
//  Created by space on 2018/5/24.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    1、实例化 2、属性 3、调用addsubview
//    1 Frame 作用：完成实例化
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 300, 50)];
    label1.backgroundColor = [UIColor grayColor];
    label1.text = @"space 你好";
    label1.textColor = [UIColor blueColor];
    [self.view addSubview:label1];
    
//  2 字体
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 130, 300, 50)];
    label2.backgroundColor = [UIColor grayColor];
    label2.text = @"space 你好";
    label2.textColor = [UIColor blueColor];
    
//    属性 ：字体 font 类名 + systemFontOfSize ：字体大小编号
//    label2.font = [UIFont systemFontOfSize:12];
    
//    使用字体名称
    label2.font = [UIFont fontWithName:@"Aril-BoldMT" size:25.0];
    [self.view addSubview:label2];
    
//   3 对齐方式 相对于UILabel
    label2.textAlignment = NSTextAlignmentRight;
    
//    4 截断
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 300, 50)];
    label4.backgroundColor = [UIColor grayColor];
    label4.font = [UIFont systemFontOfSize:20.0];
    label4.text = @"space 你好  space 你好  space 你好  space 你好  space 你好  space 你好  space 你好";
    label4.textColor = [UIColor blueColor];
    label4.lineBreakMode = NSLineBreakByTruncatingHead;
    [self.view addSubview:label4];
    
//  5 完全显示
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(20, 260, 300, 50)];
    label5.backgroundColor = [UIColor grayColor];
    label5.font = [UIFont systemFontOfSize:12.0];
    label5.text = @"space 你好  space 你好  space 你好  space 你好  space 你好  space 你好  space 你好";
    label5.textColor = [UIColor blueColor];
    label5.lineBreakMode = NSLineBreakByTruncatingHead;

//  设置为适配长度的字体大小，效果不好
//    label5.adjustsFontSizeToFitWidth = true;
    
//    num 为0的时候 text自适应调整
    label5.numberOfLines = 0;
    [self.view addSubview:label5];
    
    
//  6 边框阴影效果
    UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(20, 320, 300, 50)];
    label6.backgroundColor = [UIColor grayColor];
    label6.font = [UIFont systemFontOfSize:16.0];
    label6.text = @"边框阴影效果";
    label6.textColor = [UIColor blueColor];

//  继承了UIView所以阴影效果也有
//    label6.layer.borderColor =[UIColor redColor].CGColor;
//    label6.layer.borderWidth = 10;
    label6.layer.shadowColor = [UIColor greenColor].CGColor;
    label6.layer.shadowOffset = CGSizeMake(5, 5);
    label6.layer.shadowOpacity = 0.5;
    label6.shadowColor = [UIColor greenColor];
    label6.shadowOffset = CGSizeMake(2, 2);
    [self.view addSubview:label6];
    
    
//   7 根据内容获取合适的宽高
    UIFont *font = [UIFont systemFontOfSize:16.0];
    NSString *str = @"7 获取合适的宽高";
    CGSize labelWH = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    
    UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(20, 400, labelWH.width, labelWH.height)];
    label7.backgroundColor = [UIColor grayColor];
    label7.font = font;
    label7.text = str;
    label7.textColor = [UIColor blueColor];
    [self.view addSubview:label7];

    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
