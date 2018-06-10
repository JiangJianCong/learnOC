//
//  CanvasView.m
//  DrawPrj
//
//  Created by space on 2018/6/10.
//  Copyright © 2018 space. All rights reserved.
//

#import "CanvasView.h"
#import "LineModel.h"

@interface CanvasView()

@property(nonatomic, assign) CGMutablePathRef path;
@property(nonatomic, strong) NSMutableArray *lineModels;

@end




@implementation CanvasView

-(instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        self.lineModels = [NSMutableArray array];
        

    }
    return self;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    
    self.path = CGPathCreateMutable();
    CGPathMoveToPoint(self.path, NULL, pt.x, pt.y);
    

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    
    CGPathAddLineToPoint(self.path, NULL, pt.x, pt.y);
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LineModel *lineModel = [[LineModel alloc] init];
    lineModel.path = CGPathCreateMutableCopy(self.path); // 即使self.path被释放掉也不影响值
    lineModel.lineWidth = self.lineWidth;
    lineModel.color = self.color;
    [self.lineModels addObject:lineModel];
    
    CGPathRelease(self.path);
    self.path = nil;
    
}

- (void)drawRect:(CGRect)rect {
    [self.lineModels enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LineModel *model = obj;
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, model.path);
        CGContextSetLineWidth(context, model.lineWidth);
        CGContextSetStrokeColorWithColor(context, model.color.CGColor);
        CGContextDrawPath(context, kCGPathStroke);
    }];
    
    if (self.path) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, self.path);
        CGContextSetLineWidth(context, self.lineWidth);
        CGContextSetStrokeColorWithColor(context, self.color.CGColor);
        CGContextDrawPath(context, kCGPathStroke);
    }
}


/**
 回退
 */
-(void)undo {
    if (self.lineModels.count > 0) {
        [self.lineModels removeLastObject];
        [self setNeedsDisplay];

    }
}


/**
 清屏
 */
-(void)clear {
    [self.lineModels removeAllObjects];
    [self setNeedsDisplay];
    
}

@end
