//
//  main.m
//  KVO
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        KVOClass *kvo = [[KVOClass alloc]init];
        [kvo testKVO];
    }
    return 0;
}
