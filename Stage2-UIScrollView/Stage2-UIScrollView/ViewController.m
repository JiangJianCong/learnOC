//
//  ViewController.m
//  Stage2-UIScrollView
//
//  Created by space on 2018/6/11.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate> {
    UIScrollView *scrollview;
    NSTimer *timer;
    int imageIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [self scrollView1];
//    [self scrollview2];
    [self scrollview5];
}


/**
 1、每次拖拽，展示一张图片
 2、自动播放一张图片
 3、使用到 UIScrollView UIImageView NSTimer 循环滚动
 */
-(void)scrollview5 {
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 200)];
    scrollview.contentSize = CGSizeMake(414 * 4, 200);
    scrollview.backgroundColor = [UIColor clearColor]; // 清除背景
    scrollview.pagingEnabled = true;
    scrollview.delegate = self;
    for (int index = 0; index < 4; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(414*index, 0, 414, 200)];
        NSString *imagePath = [NSString stringWithFormat:@"%d.jpg",index+1];
        imageView.image = [UIImage imageNamed:imagePath];
        [scrollview addSubview:imageView];
    }
    [self.view addSubview:scrollview];
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(imagePlay) userInfo:nil repeats:true];
    imageIndex = 0;
}
-(void)imagePlay {
    scrollview.contentOffset = CGPointMake(imageIndex*414, 0);
    imageIndex++;
    if (imageIndex >= 4) {
        imageIndex = 0;
    }
}

/**
 循环监听
 1、时刻监听：回调
 2、合适的位置：跳转逻辑
 3、设置5个页面 2 0 1 2 0看起来跳转更流畅
 */
-(void) scrollview3 {
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 414, 200)];
    scrollview.contentSize = CGSizeMake(414*5, 200);
    scrollview.delegate = self;
    scrollview.pagingEnabled = true; // 分页
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"2";
    [scrollview addSubview:label];
    scrollview.contentOffset = CGPointMake(414, 0);
    
    for (int i = 0; i < 4 ; i++ ) {
        float labelx = (i+1)*414;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelx, 0, 100, 100)];
        label.backgroundColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"%d",i%3];
        [scrollview addSubview:label];
    }
    [self.view addSubview: scrollview];
    
}



/**
 大图展示
 1、UIScrollView 对象
 2、UIImageView
 3、UIImageView->UIScrollView
 4、UIScrollView->self.view
 */
-(void)scrollview2 {
    /*
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5.jpg"]];
    [self.view addSubview:imageView];
    
    NSLog(@"image:%@",NSStringFromCGSize(imageView.frame.size));
    NSLog(@"screen:%@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));
    */
    
    //    如果frame和contentsize 相等，就不能滚动;
    UIScrollView *scrollview1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, 414, 200)];
    scrollview1.contentSize = CGSizeMake(1440, 900);
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 1440, 900)];
    imageview.image = [UIImage imageNamed:@"5.jpg"];
    
    scrollview1.backgroundColor = [UIColor grayColor];
    [scrollview1 addSubview:imageview];
    [self.view addSubview:scrollview1];
}


/**
 属性
 */
-(void)scrollView1 {
    //    1 Frame:可见内容 contentSize:内容
    UIScrollView *scrollview1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 414, 200)];
    //    2:属性
    scrollview1.contentSize = CGSizeMake(414*5, 200);
    scrollview1.backgroundColor = [UIColor grayColor];
    scrollview1.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollview1.bounces = true; // 表明当前滑动是否有反弹效果
    scrollview1.pagingEnabled = true; // 分页效果
    scrollview1.scrollEnabled = true; // 使当前能够滑动和不能滑动
    scrollview1.contentOffset = CGPointMake(414, 0); // 初始位置
    
    scrollview1.delegate = self;
    
    
    //    3:add
    [self.view addSubview:scrollview1];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(414, 0, 414, 50)];
    lab.text = @"Hello";
    lab.textColor = [UIColor redColor];
    lab.backgroundColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:12.0];
    [scrollview1 addSubview:lab];
    
}


/**
 滚动的时候就不停回调
 1、精度很高
 2、滚动坐标：使用场景
 3、并不是线性增长
 
 @param scrollView 监听的scrollview
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    float x = scrollView.contentOffset.x;
    //    NSLog(@"x%f",x);
    float x = scrollView.contentOffset.x;
    if (x == 414*4) {
        CGPoint point = CGPointMake(414, 0);
        scrollView.contentOffset = point;
    } else if(x==0){
        CGPoint point = CGPointMake(414*3, 0);
        scrollView.contentOffset = point;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
