//
//  MyDataSource.m
//  团购
//
//  Created by space on 2018/7/30.
//  Copyright © 2018 space. All rights reserved.
//
// 1 单例类 2 单例模式
#import "MyDataSource.h"
@interface MyDataSource (){
    NSString *currentCityName;
    NSMutableArray *homeProductDataArray;
}

@end
@implementation MyDataSource

// 1 全局变量
static id _instance = nil;

// 2 单例方法
+(instancetype) getInstance{
    return [[self alloc]init];
}

// 3 初始化方法 只执行一次
-(instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 初始化当前实例对象
        _instance = [super init];
    });
    return _instance;
}

-(void)setCityName:(NSString*)str {
    currentCityName = str;
}
-(NSString*)getCityName {
    return currentCityName;
}

-(void)setHomeData:(NSMutableArray *)array {
    homeProductDataArray = array;
}
-(NSMutableArray *)getHomeData {
    return homeProductDataArray;
}



@end
