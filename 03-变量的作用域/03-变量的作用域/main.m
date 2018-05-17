//
//  main.m
//  03-变量的作用域
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SQUARE(x) x*x
#define PRINTSQUARE(x,y) NSLog(@"%d的平方是%d",x,y)

int count(int num){
    return (num) * (num);
}

int main(int argc, const char * argv[]) {
    
    int a = 2;
    NSLog(@"a = %d",a);
    
    
    @autoreleasepool {
//        1 作用域
        int a = 1;
        NSLog(@"a = %d",a);
        NSLog(@"%d",count(13));
        PRINTSQUARE(5, SQUARE(5));
        
        
        
    }
    return 0;
}
