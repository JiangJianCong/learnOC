//
//  StockClass.h
//  K线图绘制
//
//  Created by space on 2018/6/7.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockClass : NSObject
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)float beginPrice;
@property(nonatomic,assign)float endPrice;
@property(nonatomic,assign)float maxPrice;
@property(nonatomic,assign)float minPrice;
@property(nonatomic,assign)int tradeVolume;

@end
