//
//  CanvasViewController.m
//  DrawPrj
//
//  Created by space on 2018/6/10.
//  Copyright © 2018 space. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasView.h"
#import "ToolView.h"
#import "ColorView.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface CanvasViewController ()

@property(nonatomic, strong) CanvasView *canvasView;
@property(nonatomic, strong) ToolView *toolView;
@property(nonatomic, strong) ColorView *colorView;

@property BOOL bEraserMode;
@property UIColor *lastColor;
@property CGFloat lastLineWidth;

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.lastColor = [UIColor blackColor];
    self.lastLineWidth = 2;
    
    
    [self.view addSubview:self.canvasView];
    [self.view addSubview:self.toolView];
    [self.view addSubview:self.colorView];
    
    [self configToolView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(self.view.center.x - 40, CGRectGetHeight(self.view.frame) - 50, 80, 50);
    [backBtn setImage:[UIImage imageNamed:@"chahao"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 拿到回调要做的事情
 */
-(void) configToolView {
    
    __weak typeof (self) weakself = self;
    self.toolView.penBlock = ^{
        weakself.bEraserMode = NO;
        weakself.canvasView.color = weakself.lastColor;
        weakself.canvasView.lineWidth = weakself.lastLineWidth;
        
    };
    
    self.toolView.eraserBlock = ^{
        weakself.bEraserMode = YES;
        weakself.canvasView.color = [UIColor whiteColor];
        weakself.canvasView.lineWidth = 50;
    };
    
    self.toolView.colorBlock = ^{
        [weakself.colorView showAnimation];
    };
    
    self.toolView.undoBlock = ^{
        [weakself.canvasView undo];
    };
    
    self.toolView.clearBlock = ^{
        [weakself.canvasView clear];
    };
    
    self.toolView.saveBlock = ^{
        [weakself saveImageToAlbum:[weakself screenView:weakself.canvasView]];
        
    };
    
    self.toolView.sliderBlock = ^(CGFloat width) {
        if (!weakself.bEraserMode) {
            weakself.canvasView.lineWidth = width;
        }
        weakself.lastLineWidth = width;
        
    };
}

-(UIImage *) screenView:(UIView *)view {
    CGRect rect = view.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


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

-(void)image:(UIImage *) image didFinishSavingWithError:(NSError *) error contextInfo:(void*)contextInfo {
    if (error) {
        NSLog(@"保存图片失败");
    } else {
        NSLog(@"保存图片成功");
    }
}


/**
 初始化ToolView

 @return 返回初始化之后的ToolView
 */
-(ToolView *)toolView {
    if (!_toolView) {
        _toolView = [[ToolView alloc] initWithFrame:CGRectMake(20, 30, self.view.frame.size.width - 40, 100)];
    }
    return _toolView;
}





/**
 返回键
 
 @param sender 传入的返回键
 */
-(void) clickBack:(id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(CanvasView *) canvasView {
    if (!_canvasView) {
        _canvasView = [[CanvasView alloc]initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, self.view.frame.size.height - 130 -20)];
        _canvasView.color = [UIColor blackColor];
        _canvasView.lineWidth = 2;
    }
    return _canvasView;
}

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

@end
