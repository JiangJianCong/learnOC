//
//  QuartzGra.m
//  图形上下文栈
//
//  Created by space on 2018/6/4.
//  Copyright © 2018年 space. All rights reserved.
//

#import "QuartzGra.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>


@implementation QuartzGra

- (void)drawRect:(CGRect)rect {
//    [self drawMyLine];
//    [self drawMyImage];
//    [self drawMyImageClip];
//    [self drawMyTitle];
//    [self drawMyImage2];
    [self drawMyImage3];
}


/**
 图片的几何变换,
 后数据 算法优化 -> 特效相机
 */
-(void) drawMyImage3 {
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    
    size_t width = 100;
    size_t height = 63;
    
    // 每个像素 = R + G + B + alpha
    size_t bytePerRow = width * 4;
    CGImageAlphaInfo alphaInfo = kCGImageAlphaPremultipliedFirst;
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL, width, height, 8, bytePerRow, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault|alphaInfo);
    CGContextDrawImage(bitmapContext, CGRectMake(0, 0, width, height), image.CGImage); // 渲染
    
    
    // 熟悉
    UInt8 *data = (UInt8 *)CGBitmapContextGetData(bitmapContext);
    
    vImage_Buffer src = {data,height,width,bytePerRow};
    vImage_Buffer dest = {data,height,width,bytePerRow};
    Pixel_8888 bgcolor = {0,0,0,0};
    
    vImageRotate_ARGB8888(&src, &dest, NULL, M_PI, bgcolor, kvImageBackgroundColorFill);
    
    CGImageRef rotateImageRef = CGBitmapContextCreateImage(bitmapContext);
    
    UIImage *imageNew = [UIImage imageWithCGImage:rotateImageRef scale:0.5 orientation:image.imageOrientation];
    
    [imageNew drawAtPoint:CGPointMake(100, 100)];
    
    
}

/**
 图片log
 */
-(void) drawMyImage2 {
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    [image drawAtPoint:CGPointMake(100, 100)]; // 某一个点
    [image drawAsPatternInRect:CGRectMake(100, 100, 30, 20)];
    
}

/**
 在图片上写上文字  文字log
 */
-(void) drawMyTitle {
    NSString *str = @"space niu bi";
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    [image drawAtPoint:CGPointMake(100, 100)]; // 某一个点
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy]; // mutableCopy就是把这个对象快速拷贝一份
    paragraphStyle.lineBreakMode = NSLineBreakByClipping;
    
    // 文字大小，文字截断，文字颜色
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:16.0],NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor greenColor]};
    
    [str drawInRect:CGRectMake(100, 100, 100, 10) withAttributes:dic];
    
    
}

/**
 裁剪图片
 */
-(void) drawMyImageClip {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context); // 入栈
    CGContextAddEllipseInRect(context, CGRectMake(150, 150, 60, 60));
    CGContextClip(context); // 非常重要
    CGContextFillPath(context);
    
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    [image drawAtPoint:CGPointMake(150, 150)]; // 某一个点
    
    CGContextRestoreGState(context); // 出栈
}

/**
 绘制图片
 */
-(void) drawMyImage {
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
//    [image drawAtPoint:CGPointMake(100, 100)]; // 某一个点
//    [image drawInRect:CGRectMake(100, 100, 300, 600)]; // 填充
    [image drawAsPatternInRect:CGRectMake(100, 100, 300, 600)]; // 图层的快速拷贝
    
}


/**
 图层的上下文栈
 */
-(void) drawMyLine {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context); // 入栈
    [COLOR1 setStroke];
    CGContextSetLineWidth(context, 10.0);
    CGContextMoveToPoint(context, 100, 20);
    CGContextAddLineToPoint(context, 100, 400);
    CGContextStrokePath(context);
    CGContextRestoreGState(context); // 出栈

    CGContextSaveGState(context); // 入栈
    [COLOR2 setStroke];
    CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 200, 20);
    CGContextAddLineToPoint(context, 200, 400);
    CGContextStrokePath(context);
    CGContextRestoreGState(context); // 出栈
    
    CGContextSaveGState(context); // 入栈
    [COLOR3 setStroke];
    CGContextSetLineWidth(context, 6.0);
    CGContextMoveToPoint(context, 300, 20);
    CGContextAddLineToPoint(context, 100, 400);
    CGContextStrokePath(context);
    CGContextRestoreGState(context); // 出栈

}



@end
