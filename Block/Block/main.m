//
//  main.m
//  Block
//
//  Created by space on 2018/5/20.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BClass.h"
#import "AClass.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        BClass *bclass = [[BClass alloc]init];
//        [bclass testB];
        AClass *aclass = [[AClass alloc]init];
        [aclass testBlock];
        
    }
    return 0;
}
