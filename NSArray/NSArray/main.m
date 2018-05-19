//
//  main.m
//  NSArray
//
//  Created by space on 2018/5/19.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
////        1数组的初始化
//        NSArray *array1 = [[NSArray alloc]init];
//        NSArray *array2 = [[NSArray alloc]initWithObjects:@"abc",@"def",@"hij", nil];
//        NSArray *array3 = @[@"abc",@"def"];
//
//        NSLog(@"%@",array3);

        
//        3-5
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
        [array1 addObject:@"4" ];
        NSLog(@"%@",array1);
        [array1 insertObject:@"5" atIndex:2];
        NSLog(@"%@",array1);


//        3-7
        NSString *str = @"I love space";
        NSArray *array2 = [[NSArray alloc]init];
        array2 = [str componentsSeparatedByString:@" "];
        for (NSString *item in array2) {
            NSLog(@"%@",item);
        }
        
    }
    return 0;
}
