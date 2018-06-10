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


### 新建了ToolView类，用于进行不同操作的选择
- 新建6个UIButton、1个UILabel和1个UISlider并且对其初始化
- 新建每一个组件的吧block方便外部调用
```objective-c
#import <UIKit/UIKit.h>

@interface ToolView : UIView

@property (nonatomic, copy) void(^penBlock)(void);
@property (nonatomic, copy) void(^eraserBlock)(void);
@property (nonatomic, copy) void(^colorBlock)(void);
@property (nonatomic, copy) void(^undoBlock)(void);
@property (nonatomic, copy) void(^clearBlock)(void);
@property (nonatomic, copy) void(^saveBlock)(void);
@property (nonatomic, copy) void(^sliderBlock)(CGFloat width);

@end
```

- 在CanvasViewController里面新建一个configToolView的方法来拿到回调需要做的事情

```objective-c
-(void) configToolView {
    
    __weak typeof (self) weakself = self;
    self.toolView.penBlock = ^{
        weakself.bEraserMode = NO;
        weakself.canvasView.color = [UIColor blackColor]; //weakself.lastColor;
        weakself.canvasView.lineWidth = weakself.lastLineWidth;
        
    };
    
    self.toolView.eraserBlock = ^{
        weakself.bEraserMode = YES;
        weakself.canvasView.color = [UIColor whiteColor];
        weakself.canvasView.lineWidth = 50;
    };
    
    self.toolView.colorBlock = ^{
        
    };
    
    self.toolView.undoBlock = ^{
        [weakself.canvasView undo];
    };
    
    self.toolView.clearBlock = ^{
        [weakself.canvasView clear];
    };
    
    self.toolView.saveBlock = ^{
        
    };
    
    self.toolView.sliderBlock = ^(CGFloat width) {
        if (!weakself.bEraserMode) {
            weakself.canvasView.lineWidth = width;
        }
        weakself.lastLineWidth = width;
        
    };
}
```

- 新建了变量，用于存储使用橡皮擦之前的线条是什么
	- 3个变量
```objective-c
@property BOOL bEraserMode;
@property UIColor *lastColor;
@property CGFloat lastLineWidth;
```

- 在CanvansView.h里面新增2个外部调用的函数

```objective-c
#import <UIKit/UIKit.h>
@interface CanvasView : UIView
...
-(void)undo;
-(void)clear;
...
@end
```


### 画图板
- 新建画图板类
	- 画图板的宽高和屏幕一样，因为方便随便点击就能继续画画
```objective-c
	-(ColorView *) colorView {
    if (!_colorView) {
        _colorView = [[ColorView alloc] initWithFrame:self.view.frame];
    }
    return _colorView;
	}
```

- 画板类下面加了个bottomView，用来选颜色用

- 在bottomView中加了10个颜色button，用来对不同颜色的选择

- 新增一个block提供给CanvasViewController来调用，用来传输颜色
```objective-c
@interface ColorView : UIView
...
@property (nonatomic, copy) void(^selectColorBlock)(UIColor *color);
...
@end
```

- 在CanvasViewController调用
```objective-c
-(ColorView *) colorView {
    if (!_colorView) {
        _colorView = [[ColorView alloc] initWithFrame:self.view.frame];
        __weak typeof (self) weakify = self;
        _colorView.selectColorBlock = ^(UIColor *color) {
            if (!weakify.bEraserMode) {
                weakify.canvasView.color = color;
            }
            weakify.lastColor = color;
        };
    }
    return _colorView;
}
```

### 保存到相册
- 设置权限
```xml
	// 在info.pkist下加入这两项
	<key>NSPhotoLibraryUsageDescription</key>
	<string>使用照片</string>
	<key>NSPhotoLibraryAddUsageDescription</key>
	<string>使用照片</string>
	
```

- 在CanvasViewController里面加上代码
```objective-c
// 加入两个新的包
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
...
// 在回调block调用
self.toolView.saveBlock = ^{
	[weakself saveImageToAlbum:[weakself screenView:weakself.canvasView]];
        
};
...
// 截屏
-(UIImage *) screenView:(UIView *)view {
    CGRect rect = view.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
...
/**
 保存图片

 @param image 返回image
 */
-(void) saveImageToAlbum:(UIImage *)image {
    
    // 判断有没有相册权限
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        NSLog(@"没有访问权限");
    } else {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:),(__bridge void *)self);
        
        
    }
}
```