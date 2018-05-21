//
//  AClass.m
//  Notification1
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "AClass.h"

@implementation AClass
-(id)init{
    self = [super init];
    if (self) {
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"TESTNOTIF" object:nil];
        //发送带参数的广播
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        [dic setValue:@"123" forKey:@"keya"];
        //参数1 ： 广播唯一的名称 参数2 ：发送的唯一对象 参数3 ：字典
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TESTNOTIF" object:[NSNumber numberWithInt:5] userInfo:dic];
        //NSNumber 是一个object
    }
    return self;
}
@end
