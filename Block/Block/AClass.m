//
//  AClass.m
//  Block
//
//  Created by space on 2018/5/20.
//  Copyright © 2018年 space. All rights reserved.
//

#import "AClass.h"
// 代码块
// BLOCK声明：语法 ： 返回值+MyBlock+传递参数
//typedef int (^MyBlock)(int);
@implementation AClass


-(void) testBlock{
// 1 Block方法实现
    /*
    MyBlock b1 = ^(int b){
        NSLog(@"我是一个代码块,我的接受参数是%d",b);
        return b+1;
    };
    
    int newB = b1(10);
    NSLog(@"%d",newB);
     */
    
    /*
    //2 变量的作用范围,代码的执行顺序
    int a = 5;
    MyBlock b1 = ^(int b){
        NSLog(@"我是一个代码块,a=%d,我的接受参数是%d",a,b);
        return b+1;
    };
    
    int newB = b1(10);
    NSLog(@"%d",newB);
     */
    
    // 3类之间的通信
    
    MyBlock b1 = ^(NSString *str1) {
        NSLog(@"%@",str1);
    };
    
    BClass *classB  =[[BClass alloc]init];
    [classB testBlock:b1 str1:@"Aclass"];
    
}
@end
