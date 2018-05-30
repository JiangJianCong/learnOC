//
//  ViewController.m
//  UITextField
//
//  Created by space on 2018/5/29.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"
#import "MyTextField.h"

@interface ViewController () <UITextFieldDelegate>{
    MyTextField *textField1;
    MyTextField *textField2;
}
- (IBAction)loginAction:(id)sender;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self textField1];
//    [self textfield2];
//    [self textfield3];
    textField1 = [[MyTextField alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    
    textField2 = [[MyTextField alloc] initWithFrame:CGRectMake(20, 150, 200, 40)];

    [self.view addSubview:textField1];
    [self.view addSubview:textField2];

}



- (IBAction)loginAction:(id)sender {
    [textField1 resignFirstResponder];
    [textField2 resignFirstResponder];
    textField1.layer.borderColor = [UIColor grayColor].CGColor;
    textField2.layer.borderColor = [UIColor grayColor].CGColor;
    
}


/**
 自定义input
 */
-(void) textfield3 {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, 300, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;// 边框效果
    textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:textField];
}

-(void) textfield2 {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 110, 300, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;// 边框效果
    textField.textColor = [UIColor redColor];// 字体颜色
    textField.font = [UIFont systemFontOfSize:12.0];// 字体大小
    
    // 键盘类型
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    
    // 清除类型
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.tag = 100;
    
    // 协议委托代理
    textField.delegate = self;// 谁来响应
    
    
    [self.view addSubview:textField];
}


/**
 结束编辑的状态

 @param textField <#textField description#>
 */
-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"text=%@",textField.text);
}

/**
 textfield按return的时候会调用

 @param textField <#textField description#>
 @return <#return value description#>
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"hello,tag=%ld",(long)textField.tag);
    [textField resignFirstResponder];
    return true;
}



/**
 UITextField的使用
 */
-(void) textField1 {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 300, 30)];
    textField.borderStyle = UITextBorderStyleLine;// 边框效果
    textField.textColor = [UIColor redColor];// 字体颜色
    textField.font = [UIFont systemFontOfSize:12.0];// 字体大小
    textField.placeholder = @"123";    // 提示
    
    // return按钮
    textField.returnKeyType = UIReturnKeyGo;
    
    
    
    [self.view addSubview:textField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
