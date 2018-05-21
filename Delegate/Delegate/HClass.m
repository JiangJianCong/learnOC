//
//  HClass.m
//  Delegate
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "HClass.h"


@implementation HClass
-(void)testDelegate {
    AClass *classa = [[AClass alloc]init];
    classa.Delegate = self;//实现了委托
    [classa myBuyTicket];

}
-(void) buyTicket {
    NSLog(@"我是黄牛，我正在帮你买票");
}

@end
