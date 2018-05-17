//
//  Person.m
//  分类和类扩展
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Person.h"
@interface Person() {
    BOOL male;
}
@end

@implementation Person

-(id) init {
    self = [super init];
    if (self) {
        male = true;
    }
    
    return self;
}

-(void)eating{
    if (male) {
        NSLog(@"我是男的，并且在食堂吃饭");
    }else {
        NSLog(@"我是女的，并且在食堂吃饭");
    }
    
}

@end
