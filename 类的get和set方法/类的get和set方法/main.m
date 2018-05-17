//
//  main.m
//  类的get和set方法
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        person.age = 20;                
        NSLog(@"%d",person.age);
        
        
        
        
    }
    return 0;
}
