//
//  main.m
//  Timer
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyTimer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyTimer *timer = [[MyTimer alloc]init];
        [timer testTimer];
    }
    return 0;
}
