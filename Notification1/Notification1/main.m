//
//  main.m
//  Notification1
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BClass *b1 = [[BClass alloc]init];
        [b1 testNotification];
        
    }
    return 0;
}
