//
//  ViewController.m
//  UIImageView
//
//  Created by space on 2018/5/26.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
//    1UIImageView = UI + Image + view  用来显示图片的视图view
//    UIImage : 具体的图片
//    把图片读取进来

    UIImage *image = [UIImage imageNamed:@"0.jpg"];

//    方法1
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 300, 200)];
//    imageView.image = image;

//    方法2
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    */
    
    /*
//    2显示方法
    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 300, 400)];
    imageView.image = image1;

    
//    在contentMode里面有不同的效果
//    铺满
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    等比例拉伸
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.layer.borderWidth = 2.0;
    [self.view addSubview:imageView];
    
     */
    
    /*
//    3 几何变换
    UIImage *image = [UIImage imageNamed:@"0.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 300, 200)];
    imageView.image = image;

//    中心移动的位置
//    imageView.center = CGPointMake(300, 400);
    
//    旋转属性
//    imageView.transform = CGAffineTransformMakeRotation(M_1_PI);
    
//    缩放方法
//    imageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
//    通过transform 缩放
    imageView.transform = CGAffineTransformMakeTranslation(100, 100);
    */
    
    /*
//    4幻灯片
    NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4;  i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [imagesArray addObject:image];
    }
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 300, 200)];
//    播放周期
    imageView.animationDuration = [imagesArray count];
//    播放图片
    imageView.animationImages = imagesArray;
//    当前重复的次数
    imageView.animationRepeatCount = 2;
    [self.view addSubview:imageView];
    [imageView startAnimating];
    
     */
    
//  4阴影效果 继承 UIView
    UIImage *image = [UIImage imageNamed:@"0.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.layer.backgroundColor = [UIColor greenColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(5, 5);
    imageView.layer.shadowOpacity = 0.5;
    imageView.alpha = 0.5;
    [self.view addSubview:imageView];
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
