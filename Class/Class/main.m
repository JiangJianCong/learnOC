//
//  main.m
//  Class
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "PrintClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        Person *person1 = [[Person alloc] init];
//        person1.name = @"space";
//        person1.age = 18;
//        person1.male = true;
//        [person1 eating];
//        PrintClass *printclass1 = [[PrintClass alloc] init];
//        [printclass1 printClass];
        
        Person *person = [[Person alloc] initWithName:@"space" age:18];
        NSLog(@"%@  %d",person.name,person.age);
        
        
        
    }
    return 0;
}
