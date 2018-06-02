//
//  Quartz.m
//  Quartz2d1
//
//  Created by space on 2018/6/2.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Quartz.h"

@implementation Quartz

// 必调用 setNeedDisplay
-(void)drawRect:(CGRect)rect {
//    [self drawLine];
//    [self drawMyRect];
//    [self drawMyPath1];
//    [self drawMyPath2];
//    [self drawMyArc];
//    [self drawCicle];
//    [self drawCicle2];
//    [self drawMyProperty1];
//    [self drawMyProperty2];
//    [self drawMyProperty3];
    [self drawMyProperty4];
}


/**
 条形码
 */
-(void)drawMyProperty4 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 10.0);
    CGFloat length[] = {1,2,1,3,1,4,2,1};
    CGContextSetLineDash(context, 0, length, 8);
    
    CGContextMoveToPoint(context, 100, 0);
    CGContextAddLineToPoint(context, 100, 700);
    CGContextStrokePath(context);
    
}
/**
 虚线
 */
-(void)drawMyProperty3 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 10.0);
    
    CGFloat length[] = {10,20,10};
    CGContextSetLineDash(context, 0, length, 3);
    CGContextMoveToPoint(context, 100, 0);
    CGContextAddLineToPoint(context, 100, 700);
    CGContextStrokePath(context);
    
}

-(void)drawMyProperty2 {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 5.0);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGMutablePathRef pathRef = CGPathCreateMutable(); // 创建一个多路径的
    CGPathMoveToPoint(pathRef, nil, 150, 150); // 创建一个起点
    CGPathAddLineToPoint(pathRef, nil, 300, 300); // 第二个点
    CGPathAddLineToPoint(pathRef, nil, 0, 300); // 第二个点
    
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context, kCGPathFillStroke);
}

-(void) drawMyProperty1 {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 10.0); // 设置宽度
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    CGContextMoveToPoint(context, 100, 100); // 绘制一个点
    CGContextAddLineToPoint(context, 300, 300); // 绘制另外一个点
    CGContextStrokePath(context);
}

/**
 绘制 弧形
 */
-(void) drawCicle2 {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 5.0);
    
    // 200 200 圆心 ； 150 半径 0和M_PI*2 开始和终止的弧度 （0，1）
    CGContextAddArc(context, 200, 200, 150, 0, M_PI,  1);
    
    // 闭合
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

/**
 绘制 圆型
 */
-(void) drawCicle {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 5.0);
    
    // 200 200 圆心 ； 150 半径 0和M_PI*2 开始和终止的弧度 （0，1）
    CGContextAddArc(context, 200, 200, 150, 0, M_PI*2,  1);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

/**
 绘制 任意意弧形
 */
-(void) drawMyArc {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 5.0);
    CGMutablePathRef pathRef = CGPathCreateMutable(); // 创建一个多路径的
    CGContextMoveToPoint(context, 100, 200);
    
    // 绘制弧形
    //
    CGContextAddCurveToPoint(context, 200, 100, 200, 300, 300, 200);
    
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}


/**
 绘制 闭合 三角形
 */
-(void) drawMyPath2 {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 5.0);
    CGMutablePathRef pathRef = CGPathCreateMutable(); // 创建一个多路径的
    CGPathMoveToPoint(pathRef, nil, 150, 150); // 创建一个起点
    CGPathAddLineToPoint(pathRef, nil, 300, 300); // 第二个点
    CGPathAddLineToPoint(pathRef, nil, 0, 300); // 第三个点
    CGPathAddLineToPoint(pathRef, nil, 150, 150); // 连接起点起点
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}
/**
 绘制 非闭合 三角形
 */
-(void) drawMyPath1 {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill];
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 5.0);
    CGMutablePathRef pathRef = CGPathCreateMutable(); // 创建一个多路径的
    CGPathMoveToPoint(pathRef, nil, 150, 150); // 创建一个起点
    CGPathAddLineToPoint(pathRef, nil, 300, 300); // 第二个点
    CGPathAddLineToPoint(pathRef, nil, 0, 300); // 第二个点
    
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context, kCGPathFillStroke);

}

/**
 绘制矩形
 */
-(void) drawMyRect {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR1 setFill]; // 内部填充颜色
    [COLOR2 setStroke]; //
    CGContextSetLineWidth(context, 10.0); // 设置宽度
    CGContextAddRect(context, CGRectMake(100, 100, 200, 100));
    CGContextDrawPath(context, kCGPathFillStroke); // 绘制边框和内容
    
//    CGContextStrokePath(context); // 绘制边框
    
}

/**
 绘制直线
 */
-(void) drawLine {
    // 1 获取绘图的画板
    // 2 开始画图
    // 3 渲染
    CGContextRef context = UIGraphicsGetCurrentContext();
    [COLOR2 setStroke]; //颜色
    CGContextSetLineWidth(context, 10.0); // 设置宽度
    CGContextMoveToPoint(context, 100, 100); // 绘制一个点
    CGContextAddLineToPoint(context, 300, 300); // 绘制另外一个点
    CGContextStrokePath(context);
}

@end
