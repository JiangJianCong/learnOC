//
//  SpaceMainViewController.m
//  PhotoProject
//
//  Created by space on 2018/8/18.
//  Copyright © 2018 space. All rights reserved.
//

#import "SpaceMainViewController.h"
#import "SpaceMainTopView.h"


@interface SpaceMainViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScroll;

@property (nonatomic, strong) NSArray * datalist;

@property (nonatomic, strong) SpaceMainTopView * topView;

@end

@implementation SpaceMainViewController

- (SpaceMainTopView *)topView {
    if (!_topView) {
        _topView = [[SpaceMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titleName:self.datalist];
        
        @weakify(self);
        
        _topView.block = ^(NSInteger tag) {
            @strongify(self);
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH, self.contentScroll.contentOffset.y);
            [self.contentScroll setContentOffset:point animated:YES];
        };
    }
    return _topView;
}

- (NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"首页",@"朋友"];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}

-(void)initUI {
    // 添加左右按钮
    [self setupNav];
    
    // 添加子视图控制器
    [self setupChildViewControllers];
}

-(void)setupChildViewControllers {
    NSArray * vcNames = @[@"SpaceHomeViewController",@"SpaceFrisViewController"];
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString * vcName = vcNames[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc]init];
        vc.title = self.datalist[i];
        
        // 当执行这句话时，不会执行改vc的viewDidLoad
        [self addChildViewController:vc];
    }
    
    // 将子控制器的view，驾到MainVC的scrollview上
    
    // 设置scrollview的contentsize
    self.contentScroll.contentSize = CGSizeMake(SCREEN_WIDTH*self.datalist.count, 0);
    
    self.contentScroll.contentOffset = CGPointMake(0, 0);
    
    // 进入主控制器加载第一个页面
    [self scrollViewDidEndScrollingAnimation:self.contentScroll];
}
-(void)setupNav {
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    
    CGFloat offset = scrollView.contentOffset.x;
    
    // 获取索引值
    NSInteger idx = offset / width;
    
    [self.topView scrolling:idx];
    
    // 根据索引值返回vc引用
    UIViewController *vc = self.childViewControllers[idx];
    
    // 判断当前nv是否执行过
    if ([vc isViewLoaded]) {
        return;
    }
    
    // 设置子控制器的view的大小
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);
    
    // 将子控制器的view加入到scrollview上
    [scrollView addSubview:vc.view];
}

/**
 减速结束时调用加载子控制器view的方法
 
 @param scrollView scrollview
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
