//
//  Person.m
//  Class
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id) init {
    self = [super init];
    if (self) {
        NSLog(@"我是构造方法");
        self.age = 18;
    }
    return self;
}
-(id)initWithName:(NSString *)name age:(int) age {
    self = [super init];
    if (self) {
        self.age = age;
        self.name = name;
    }
    return self;
}

-(void)eating{
    NSLog(@"我正在吃饭");
}

@end
