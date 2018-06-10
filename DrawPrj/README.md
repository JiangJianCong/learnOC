# 画图版
***
### 解锁之后新增了一个UINavgationCOntroller

- 使用方法

```objective-c
FunctionViewController *vc = [[FunctionViewController alloc] init];
UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
[nav setNavigationBarHidden:YES];
[self presentViewController:nav animated:YES completion:nil];
```

### 画图板在手指操作离开屏幕后还能继续画图

- 定义线模型
```objective-c
// 定义一个数组，lineModel是另一个类，用来装一条线的CGMutablePathRef
@property(nonatomic, strong) NSMutableArray *lineModels; 

```



- touchesEnded的时候

```objective-c
  - (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
      LineModel *lineModel = [[LineModel alloc] init];
      lineModel.path = CGPathCreateMutableCopy(self.path); // 即使self.path被释放掉也不影响值
      lineModel.lineWidth = 2;
      lineModel.color = [UIColor blackColor];
      [self.lineModels addObject:lineModel];
      
      CGPathRelease(self.path);
      self.path = nil;
      
  }
```

  

- drawRect的时候需要重新绘画

```objective-c
- (void)drawRect:(CGRect)rect {
    // 对存起来的图重新绘制
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
        CGContextSetLineWidth(context, 2);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        CGContextDrawPath(context, kCGPathStroke);
    }
}
```

