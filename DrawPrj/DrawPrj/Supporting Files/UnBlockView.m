//
//  UnBlockView.m
//  DrawPrj
//
//  Created by space on 2018/6/9.
//  Copyright © 2018 space. All rights reserved.
//

#import "UnBlockView.h"

@interface UnBlockView ()

@property(nonatomic, assign) CGMutablePathRef path;

@end

@implementation UnBlockView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    
    // 判断该点是否落在手势点
    self.path = CGPathCreateMutable();
    CGPathMoveToPoint(self.path, NULL, pt.x, pt.y);
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    
    CGPathAddLineToPoint(self.path, NULL, pt.x, pt.y);
    
    [self setNeedsDisplay]; // 触发方法
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPathRelease(self.path);
    self.path = nil;
}

- (void)drawRect:(CGRect)rect {
    if (self.path) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, self.path);
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetLineWidth(context, 4);
        CGContextDrawPath(context, kCGPathStroke);
    }
}
@end
