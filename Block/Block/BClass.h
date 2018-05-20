//
//  BClass.h
//  Block
//
//  Created by space on 2018/5/20.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MyBlock)(NSString*);

@interface BClass : NSObject
-(void) testBlock:(MyBlock) block str1:(NSString *) str1;

@end
