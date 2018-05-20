//
//  BClass.m
//  Block
//
//  Created by space on 2018/5/20.
//  Copyright © 2018年 space. All rights reserved.
//

#import "BClass.h"

@implementation BClass
-(void) testBlock:(MyBlock) block str1:(NSString *) str1{
    NSLog(@"我是被谁调用的:%@",str1);
    NSLog(@"这是B类");
    block(@"我是从B类来的");
}
@end
