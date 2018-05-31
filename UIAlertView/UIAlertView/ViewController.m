//
//  ViewController.m
//  UIAlertView
//
//  Created by space on 2018/5/31.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"
#import "MyViewToAlertView.h"

@interface ViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self UIAlertView5];
//    [self actionSheet2];
    
    [self MyViewToAlertView];
}

-(void) MyViewToAlertView {
    MyViewToAlertView *myAlertView = [[MyViewToAlertView alloc] initWithFrame:CGRectMake(20, 100, (self.view.frame.size.width-40), 100)];
    [self.view addSubview:myAlertView];
}

-(void) UIAlertView5 {
    
    UIAlertView *uiAlertView = [[UIAlertView alloc] initWithTitle:@"alert" message:@"message" delegate:self cancelButtonTitle:@"calcel" otherButtonTitles:@"OK", nil];
    uiAlertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    UITextField *textField = [uiAlertView textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    [uiAlertView show];
}


// 输入
-(void) UIAlertView4 {
    UIAlertView *uiAlertView = [[UIAlertView alloc] initWithTitle:@"alert" message:@"message" delegate:self cancelButtonTitle:@"calcel" otherButtonTitles:@"OK", nil];
    uiAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [uiAlertView textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    [uiAlertView show];
}

// 通信，代理响应方法
-(void) UIAlertView3 {
    UIAlertView *uiAlertView = [[UIAlertView alloc] initWithTitle:@"alert" message:@"message" delegate:self cancelButtonTitle:@"calcel" otherButtonTitles:@"1",@"2", nil];
    
    [uiAlertView show];

}

// alert的响应事件  cancel 永远你都是 index：0  其他按顺序
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld",buttonIndex);
    
    // 点击ok，输出输入框的树枝
    if (buttonIndex == 1) {
        UITextField *textFieldName = [alertView textFieldAtIndex:0];
        UITextField *textFieldPwd = [alertView textFieldAtIndex:1];
        NSLog(@"name:%@,password=%@",textFieldName.text,textFieldPwd.text);
        
    }
}



-(void) UIAlertView2 {
    UIAlertView *uiAlertView = [[UIAlertView alloc] initWithTitle:@"alert" message:@"message" delegate:nil cancelButtonTitle:@"calcel" otherButtonTitles:@"OK", nil];
    [uiAlertView show];
}

// 如何使用alertView的方法，但是alertview在ios9.0以后的版本就已经没用了
// 现在的是UIAlertController
-(void) UIAlertView1 {
    UIAlertView *uiAlertView = [[UIAlertView alloc] initWithTitle:@"alert" message:@"message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [uiAlertView show];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --Action Sheet
-(void) actionSheet1 {
    // 实力话
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"action" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:@"OK" otherButtonTitles:nil, nil];
    // 风格
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
}

// 响应顺序 从上倒下 依次增加
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld",buttonIndex);
}
// 取消
-(void) actionSheet2 {
    // 实力话
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"action" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"OK" otherButtonTitles:@"1",@"2", nil];
    // 风格
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
}
@end
