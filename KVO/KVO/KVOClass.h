//
//  KVOClass.h
//  KVO
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface KVOClass : NSObject
@property(nonatomic,strong) Person *p1;
-(void) testKVO;

@end
