//
//  PrintClass.m
//  Class
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import "PrintClass.h"

@implementation PrintClass

-(id) init {
    self = [super init];
    if (self) {
        NSLog(@"我是构造方法");
    }
    return self;
}

-(void)printClass{
    NSLog(@"HelloWorld!!!");
}



@end
