//
//  ViewController.m
//  GestureDemo
//
//  Created by space on 2018/5/31.
//  Copyright © 2018年 space. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self addLongPressGesture];
//    [self addSwipeGesture];
//    [self addPenGesture];
//    [self addScreenEdgePan];
//    [self addPinchGesture];
    [self addRotationGes];
}


/**
 旋转的手势
 */
-(void) addRotationGes {
    UIRotationGestureRecognizer *rotationGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGesture:)];
    
    [self.blueView addGestureRecognizer:rotationGes];
}

-(void) rotationGesture:(UIRotationGestureRecognizer*) sender {
    CGFloat rotation = sender.rotation;
    NSLog(@"%f",rotation);
}


-(void) addPinchGesture {
    UIPinchGestureRecognizer *pinchGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    
    [_blueView addGestureRecognizer:pinchGes];
    
}

-(void) pinchGesture:(UIPinchGestureRecognizer*) sender {
    CGFloat scale = sender.scale;
    NSLog(@"pinch scale =  %f",scale);
}


-(void) addScreenEdgePan {
    UIScreenEdgePanGestureRecognizer *edgePanGes = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edtPanGes:)];
    
    // 设置触发滑动的边缘
    edgePanGes.edges = UIRectEdgeRight;// 设置屏幕右边触发
    
    
    [self.view addGestureRecognizer:edgePanGes];
}

-(void) edtPanGes:(UIScreenEdgePanGestureRecognizer*) sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"刚刚开始");
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"屏幕边缘滑动手势粗发结束");
    }
}


/**
 pan手势识别
 */
-(void) addPenGesture {
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    [self.blueView addGestureRecognizer:panRecognizer];
}

-(void) panGesture:(UIPanGestureRecognizer*) sender {
    // 获取滑动的点
    CGPoint point = [sender locationInView:_blueView];
    
    // 当前滑动的速度
    CGPoint speed = [sender velocityInView:_blueView];
    
    NSLog(@"point:%f %f Speen:%f,%f",point.x,point.y,speed.x,speed.y);
}

/**
 Swipe 的手势识别
 */
-(void) addSwipeGesture {
    UISwipeGestureRecognizer *swipeDownRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.blueView addGestureRecognizer:swipeDownRecognizer];
    
    UISwipeGestureRecognizer *swipeRighrRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    swipeRighrRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.blueView addGestureRecognizer:swipeRighrRecognizer];
}

-(void) swipeGesture:(UISwipeGestureRecognizer*) sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"down");
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"right");
    }
}


/**
 长按手势
 */
-(void) addLongPressGesture {
    UILongPressGestureRecognizer *pressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    
    
    
    [self.blueView addGestureRecognizer:pressGesture];
    
}

-(void) longPressGesture:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"LongPressBegin");
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"LongPressEnd");
    }
}

-(void) addTapGesture {
    //创建呢识别器
    UITapGestureRecognizer *tagRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagGesture:)];
    // 多少次点击才能触发
    //    tagRecognizer.numberOfTapsRequired = 2;
    
    // 2只手指才能触发
    tagRecognizer.numberOfTouchesRequired = 2;
    
    // 添加识别器
    [self.blueView addGestureRecognizer:tagRecognizer];
    
}

-(void) tagGesture:(UITapGestureRecognizer*)sender {
    NSLog(@"view tapped");
}


@end
