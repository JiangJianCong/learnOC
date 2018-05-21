//
//  Student.m
//  Notification2
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Student.h"

@implementation Student
-(id)init {
    self = [super init];
    if (self) {
        // 接受者接受方法
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifAction) name:@"TESTNOTIF" object:nil];
    }
    return self;
}

-(void) notifAction {
    NSLog(@"student 接受");
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"TESTNOTIF" object:nil];
}
@end
