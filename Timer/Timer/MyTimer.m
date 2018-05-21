//
//  MyTimer.m
//  Timer
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "MyTimer.h"

@interface MyTimer(){
    NSTimer *timer1;
    NSTimer *timer2;

}

@end

@implementation MyTimer
-(void)testTimer {
    //参数1 中断间隔 2:相应方法的对象。3:相应方法 4:传递参数。5:是否重复
    timer1 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(myLog) userInfo:nil repeats:false];
    
    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    
}

-(void) myLog{
    NSLog(@"定时器");
}
@end
