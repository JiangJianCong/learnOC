//
//  main.m
//  继承和多态
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *p1 = [[Person alloc]init];
//        [p1 eating];

//        Student *student = [[Student alloc]init];
//        [student learning];
//        [student eating];
//
//        Teacher *teacher = [[Teacher alloc]init];
//        [teacher eating];

        Person *p2 = [[Student alloc]init];
        Student *stu2 = (Student*)p2;
        [stu2 learning];
        
        
    }
    return 0;
}
