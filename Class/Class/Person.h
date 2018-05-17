//
//  Person.h
//  Class
//
//  Created by space on 2018/5/17.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,assign) int age;
@property(nonatomic,assign) BOOL male;
@property(nonatomic,copy) NSString *name;

-(id)initWithName: (NSString*)name age:(int) age;
// 实例方法。--(返回类型） 方法名 参数
-(void) eating;



@end
