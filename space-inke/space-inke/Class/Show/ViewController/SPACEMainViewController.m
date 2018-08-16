//
//  SPACEMainViewController.m
//  space-inke
//
//  Created by space on 2018/8/2.
//  Copyright © 2018 space. All rights reserved.
//

#import "SPACEMainViewController.h"
#import "SPACEMainTopView.h"

@interface SPACEMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic, strong) NSArray * datalist;

@property (nonatomic, strong) SPACEMainTopView * topView;



@end

@implementation SPACEMainViewController

- (SPACEMainTopView *)topView {
    if (!_topView) {
        _topView = [[SPACEMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titleName:self.datalist];
        
        @weakify(self);
        
        _topView.block = ^(NSInteger tag) {
            @strongify(self);
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH, self.contentScrollView.contentOffset.y);
            [self.contentScrollView setContentOffset:point animated:YES];
        };
    }
    return _topView;
}

-(NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"关注",@"热门",@"附近"];
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
    NSArray * vcNames = @[@"SPACEFocuseViewController",@"SPACEHotViewController",@"SPACENearViewController"];
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString * vcName = vcNames[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc]init];
        vc.title = self.datalist[i];
        
        // 当执行这句话时，不会执行改vc的viewDidLoad
        [self addChildViewController:vc];
    }
    
    // 将子控制器的view，驾到MainVC的scrollview上
    
    // 设置scrollview的contentsize
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*self.datalist.count, 0);
    
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    // 进入主控制器加载第一个页面
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

-(void)setupNav {
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
