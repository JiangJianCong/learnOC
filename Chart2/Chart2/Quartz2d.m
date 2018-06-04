//
//  Quartz2d.m
//  Chart2
//
//  Created by space on 2018/6/4.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Quartz2d.h"
#define COLOR1 [UIColor colorWithRed:0.54 green:0.81 blue:0.96 alpha:1.0]
#define COLOR2 [UIColor colorWithRed:0.9 green:0.5 blue:0.31 alpha:1.0]
#define COLOR3 [UIColor colorWithRed:0.24 green:0.11 blue:0.56 alpha:1.0]
#define COLOR4 [UIColor colorWithRed:0.3 green:0.7 blue:0.21 alpha:1.0]
#define COLOR5 [UIColor colorWithRed:0.4 green:0.21 blue:0.96 alpha:1.0]

@implementation Quartz2d


- (void)drawRect:(CGRect)rect {
//    [self drawMyLine];
//    [self drawMyBarhart1];
//    [self drawMyBarchart2];
    [self drawMyPie];
    
}




/**
 饼状图
 */
-(void) drawMyPie {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context); // --效果
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 200, 200);
    
    // 绘制圆
    CGContextAddArc(context, 200, 200, 150, 0, M_PI*2, 0);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context); // --效果
    
    // Part1
    CGContextSaveGState(context); // -----------
    [COLOR2 setFill];
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 200, 200);
    CGContextAddArc(context, 200, 200, 150, 0, M_PI*2*0.6, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context); // ---------
    
    // Part2
    CGContextSaveGState(context); // -----------
    [COLOR3 setFill];
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 200, 200);
    CGContextAddArc(context, 200, 200, 150, M_PI*2*0.6, M_PI*2*0.8, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context); // ---------
    
    // Part3
    CGContextSaveGState(context); // -----------
    [COLOR4 setFill];
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 200, 200);
    CGContextAddArc(context, 200, 200, 150, M_PI*2*0.8, M_PI*2, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context); // ---------
    
    
    // 添加比例
    CGContextSaveGState(context);
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 200, 320);
    CGContextAddLineToPoint(context, 260, 370);
    CGContextAddLineToPoint(context, 330, 370);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(330, 359, 50, 20)];
    lab.text = @"60.0%";
    lab.textColor = COLOR3;
    [self addSubview:lab];
    
    
}

/**
 空心柱状图
 */
-(void) drawMyBarchart2 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 内容
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 5.0);
    
    // 重点 ，上下文栈
    // 1 坐标 图形的上下文栈 1.1 save 入栈 1.2 出栈
    CGContextSaveGState(context); // --效果
    
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    
    [self drawXY:context];
    
    CGContextRestoreGState(context); // --效果
    
    CGContextAddRect(context, CGRectMake(80, 250, 40, 70));
    CGContextAddRect(context, CGRectMake(150, 250, 40, 70));
    CGContextAddRect(context, CGRectMake(220, 80, 40, 240));
    CGContextAddRect(context, CGRectMake(290, 140, 40, 180));
    CGContextAddRect(context, CGRectMake(360, 40, 40, 280));
    
    CGContextDrawPath(context, kCGPathStroke);
}

/**
 柱状图 通过width改变宽度 和addlineToPoint的方法来实现
 */
-(void) drawMyBarchart1 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 内容
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 5.0);
    
    // 重点 ，上下文栈
    // 1 坐标 图形的上下文栈 1.1 save 入栈 1.2 出栈
    CGContextSaveGState(context); // --效果
    
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    
    [self drawXY:context];
    
    CGContextRestoreGState(context); // --效果
    
    CGContextMoveToPoint(context, 90, 320);
    CGContextAddLineToPoint(context, 90, 50);

    CGContextMoveToPoint(context, 160, 320);
    CGContextAddLineToPoint(context, 160, 240);
    
    CGContextMoveToPoint(context, 230, 320);
    CGContextAddLineToPoint(context, 230, 240);

    CGContextMoveToPoint(context, 300, 320);
    CGContextAddLineToPoint(context, 300, 170);
    
    CGContextMoveToPoint(context, 370, 320);
    CGContextAddLineToPoint(context, 370, 210);
    
    CGContextStrokePath(context);
    
}

/**
 折线图,1 坐标 2直线
 */
- (void) drawMyLine {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 内容
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 5.0);
    
    // 重点 ，上下文栈
    // 1 坐标 图形的上下文栈 1.1 save 入栈 1.2 出栈
    CGContextSaveGState(context); // --效果
    
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 1.0);
    [self drawXY:context];
    
    CGContextRestoreGState(context); // --效果
    
    CGContextMoveToPoint(context, 70, 260);
    CGContextAddLineToPoint(context, 100, 50);
    CGContextAddLineToPoint(context, 200, 240);
    CGContextAddLineToPoint(context, 250, 170);
    CGContextAddLineToPoint(context, 350, 210);
    CGContextStrokePath(context);
    
    
}



-(void) drawXY:(CGContextRef)context {
    // 绘制x轴
    CGContextMoveToPoint(context, 50, 350);
    CGContextAddLineToPoint(context, 410, 350);
    CGContextAddLineToPoint(context, 400, 345);
    CGContextMoveToPoint(context, 410, 350);
    CGContextAddLineToPoint(context, 400, 355);
    
    // 绘制y轴
    CGContextMoveToPoint(context, 50, 350);
    CGContextAddLineToPoint(context, 50, 20);
    CGContextAddLineToPoint(context, 45, 30);
    CGContextMoveToPoint(context, 50, 20);
    CGContextAddLineToPoint(context, 55, 30);
    
    CGContextStrokePath(context);
    
}

@end
