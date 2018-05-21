//
//  BClass.m
//  Notification1
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "BClass.h"
// a->b
@implementation BClass
-(void)testNotification {
    //创建广播
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testAction) name:@"TESTNOTIF" object:nil];
    AClass *classa = [[AClass alloc]init];
    
    
    
}


/**
 声明广播的方法
 */
-(void) testAction {
    NSLog(@"我已经接受到广播了");
}
@end
