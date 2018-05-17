//
//  Person.h
//  类的get和set方法
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    int age;
    NSString *name;
}

-(void) setAge: (int)newAge;
-(int) age;

@end
