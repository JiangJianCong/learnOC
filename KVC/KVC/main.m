//
//  main.m
//  KVC
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc]init];
        [p1 setValue:@"henrry" forKeyPath:@"name"];
        [p1 setValue:@"18" forKeyPath:@"age"];
        
        Person *p2 = [[Person alloc] init];
        [p2 setValue:@"robin" forKeyPath:@"name"];
        [p2 setValue:@"17 " forKeyPath:@"age"];
        
        NSLog(@"p1=%@,p2=%@",p1,[p2 valueForKeyPath:@"name"]);
    }
    return 0;
}
