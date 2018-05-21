//
//  Person.m
//  Notification2
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Person.h"
#import "Teacher.h"
#import "Student.h"

@interface Person() {
    Student *s1;
    Teacher *t1;
}
@end

@implementation Person
-(void)testNotification {
//    [Teacher new];
//    [Student new];
    s1 = [[Student alloc]init];
    t1 = [[Teacher alloc]init];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"TESTNOTIF" object:nil];
}
@end
