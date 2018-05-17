//
//  Person.m
//  类的get和set方法
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void) setAge : (int)newAge {
    if (newAge >=18) {
        NSLog(@"成年人");
    }else {
        NSLog(@"未成年人");
    }
    age = newAge;
}

-(int) age{
    return age;
}

@end
