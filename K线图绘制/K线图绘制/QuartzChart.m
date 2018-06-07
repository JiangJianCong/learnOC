//
//  QuartzChart.m
//  K线图绘制
//
//  Created by space on 2018/6/7.
//  Copyright © 2018年 space. All rights reserved.
//

#import "QuartzChart.h"
#import "StockClass.h"
#define COLOR1 [UIColor colorWithRed:220/255.0 green:20/255.0 blue:60/255.0 alpha:1.0]
#define COLOR2 [UIColor colorWithRed:34/255.0 green:139/255.0 blue:34/255.0 alpha:1.0]
#define COLOR3 [UIColor colorWithRed:254/255.0 green:254/255.0 blue:254/255.0 alpha:1.0]
#define BEGIN_Y 300

@interface QuartzChart(){
    NSMutableArray *stockData;
}
@end

@implementation QuartzChart

-(instancetype)initWithFrame:(CGRect)frame stockData:(NSMutableArray*) mstockData {
    self = [super initWithFrame:frame];
    if (self) {
        stockData = mstockData;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawMyRect];
    [self drawMyLine];
    [self drawAVELine];
}



/**
 均线
 */
-(void) drawAVELine {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    
    StockClass *first = [stockData objectAtIndex:17];
    CGPoint bef = [self getAVEPoint:0 maxPrice:first.maxPrice minPrice:first.minPrice];
    CGContextMoveToPoint(context, bef.x, bef.y);
    for (int i = 18; i < stockData.count; i++) {
        StockClass *item = [stockData objectAtIndex:i];
        float max = item.maxPrice;
        float min = item.minPrice;
        [COLOR3 setStroke];
        [COLOR3 setFill];
        CGPoint current = [self getAVEPoint:i-17 maxPrice:max minPrice:min];
        CGContextAddLineToPoint(context, current.x, current.y);
        bef = current;
    }
    CGContextStrokePath(context);
    
}

-(CGPoint) getAVEPoint:(int) i maxPrice:(float) maxPrice minPrice:(float)minPrice {
    CGFloat w = 414.0 / 40 - 4;
    CGFloat x = i* 414.0/40 + w/2.0;
    CGFloat y = BEGIN_Y - (maxPrice - minPrice);
    return CGPointMake(x, y);
    
}

/**
 上下引线
 */
-(void) drawMyLine {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    
    for (int i = 17; i < stockData.count; i++) {
        StockClass *item = [stockData objectAtIndex:i];
        float beginPrice = item.beginPrice;
        float endPrice = item.endPrice;
        float maxPrice = item.maxPrice;
        float minPrice = item.minPrice;
        
        [COLOR2 setStroke];
        [COLOR2 setFill];
        if (beginPrice > endPrice) {
            CGPoint maxBeginPoint = [self getMaxBeginPoint:i-17 maxPrice:maxPrice];
            CGContextMoveToPoint(context, maxBeginPoint.x, maxBeginPoint.y);
            CGPoint maxendPoint = CGPointMake(maxBeginPoint.x, BEGIN_Y - endPrice);
            CGContextAddLineToPoint(context, maxendPoint.x, maxendPoint.y);
            
            CGPoint minBeginPoint = [self getMinBeginPoint:i - 17 lowPrice:beginPrice];
            CGContextMoveToPoint(context, minBeginPoint.x, minBeginPoint.y);
            CGPoint minEndPoint = CGPointMake(minBeginPoint.x, BEGIN_Y - minPrice);
            CGContextAddLineToPoint(context, minEndPoint.x, minEndPoint.y);
            
            CGContextDrawPath(context, kCGPathFillStroke);


        } else {
            CGContextSaveGState(context);
            [COLOR1 setStroke];
            [COLOR1 setFill];
        
            CGPoint maxBeginPoint = [self getMaxBeginPoint:i - 17 maxPrice:maxPrice];
            CGContextMoveToPoint(context, maxBeginPoint.x, maxBeginPoint.y);
            CGPoint maxendPoint = CGPointMake(maxBeginPoint.x, BEGIN_Y-beginPrice);
            CGContextAddLineToPoint(context, maxendPoint.x, maxendPoint.y);
            
            CGPoint minBeginPoint = [self getMinBeginPoint:i -17 lowPrice:endPrice];
            CGContextMoveToPoint(context, minBeginPoint.x, minBeginPoint.y);
            CGPoint minEndPoint = CGPointMake(minBeginPoint.x, BEGIN_Y - minPrice);
            CGContextAddLineToPoint(context, minEndPoint.x, minEndPoint.y);
            
            CGContextRestoreGState(context);
            
        }
    }
}

-(CGPoint) getMaxBeginPoint:(int) i maxPrice:(float) maxPrice {
    CGFloat w = 414.0 / 40 - 4;
    CGFloat x = i* 414.0/40 + w/2.0;
    CGFloat y = BEGIN_Y - maxPrice;
    return CGPointMake(x, y);
}

-(CGPoint) getMinBeginPoint:(int) i lowPrice:(float)lowPrice {
    CGFloat w = 414.0 / 40 - 4;
    CGFloat x = i* 414.0/40 + w/2.0;
    CGFloat y = BEGIN_Y - lowPrice;
    return CGPointMake(x, y);
}

/**
 柱状图
 */
-(void) drawMyRect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for (int i = 17; i < stockData.count; i++) {
        StockClass *item = [stockData objectAtIndex:i];
        float beginPrice = item.beginPrice;
        float endPrice = item.endPrice;
        [COLOR1 setStroke];
        [COLOR1 setFill];
        if (beginPrice > endPrice) {
            CGContextAddRect(context, [self getCurrentRect:i-17 beginPrice:beginPrice endPrice:endPrice]);
            CGContextDrawPath(context, kCGPathFillStroke);
        } else {
            CGContextSaveGState(context);
            [COLOR2 setStroke];
            [COLOR2 setFill];
            CGContextAddRect(context, [self getCurrentRect:i-17 beginPrice:beginPrice endPrice:endPrice]);
            CGContextDrawPath(context, kCGPathFillStroke);
            CGContextRestoreGState(context);
        }
    }
}
-(CGRect)getCurrentRect:(int)i beginPrice:(float)beginPrice endPrice:(float)endPrice {
    CGFloat x = i*414.0/40;
    CGFloat y = 0;
    CGFloat w = 414/40 - 4;
    CGFloat h = fabsf(beginPrice - endPrice);
    if (beginPrice > endPrice) {
        y = 300 - beginPrice;
    } else {
        y = 300 - endPrice;
    }
    return CGRectMake(x, y, w, h);
    
    
}


@end
