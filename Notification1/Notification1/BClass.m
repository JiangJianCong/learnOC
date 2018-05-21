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
    // 参数1:谁在接受这个方法 参数2 ： 响应方法。参数3：广播的名称。参数4:nil
    // self：当前的这个类 可以主动调用testAction
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testAction) name:@"TESTNOTIF" object:nil];
    
    //带参数的testAction的方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testAction:) name:@"TESTNOTIF" object:nil];
    AClass *classa = [[AClass alloc]init];
    
    
    
}

/**
 声明带参数的广播方法

 @param notif 用来读取数据的
 */
-(void) testAction:(NSNotification*)notif {
    NSNumber *num = notif.object;
    NSDictionary *dic = notif.userInfo;
    NSLog(@"%@",num);
    NSLog(@"%@",dic);
}

/**
 声明广播的方法
 */
-(void) testAction {
    NSLog(@"我已经接受到广播了");
}

/**
 销毁广播
 */
-(void) dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"TESTNOFIT" object:nil];
}

@end
