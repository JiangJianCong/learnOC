//
//  AClass.m
//  Notification1
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "AClass.h"

@implementation AClass
-(id)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"TESTNOTIF" object:nil];
        
        
    }
    return self;
}
@end
