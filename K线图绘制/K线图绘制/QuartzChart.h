//
//  QuartzChart.h
//  K线图绘制
//
//  Created by space on 2018/6/7.
//  Copyright © 2018年 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzChart : UIView
-(instancetype)initWithFrame:(CGRect)frame stockData:(NSMutableArray*) mstockData ;
@end
