//
//  ViewController.m
//  团购
//
//  Created by space on 2018/7/27.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"
#import "Util.h"
#import "MainViewController.h"
#import "AppDelegate.h"

@interface ViewController () {
    MainViewController *tbc_main;
}
@property(nonatomic,strong)AppDelegate *app;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL firstLoad = [self readDataPreference];
    if (!firstLoad) {
        UIScrollView *sv_boot = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        sv_boot.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT);
        sv_boot.contentOffset = CGPointMake(0, 0);
        sv_boot.pagingEnabled = true;
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            NSString *imageName = [NSString stringWithFormat:@"load%d",i+1];
            imageView.image = [UIImage imageNamed:imageName];
            [sv_boot addSubview:imageView];
        }
        
        // 屏幕适配
        CGFloat bt_w = SCREEN_WIDTH * 0.6;
        CGFloat bt_h = 40;
        CGFloat bt_x = SCREEN_WIDTH*2 + (SCREEN_WIDTH - bt_w) / 2;
        CGFloat bt_y = SCREEN_HEIGHT - bt_h - 10;
        UIButton *bt_enter = [[UIButton alloc] initWithFrame:CGRectMake(bt_x, bt_y, bt_w, bt_h)];
        [bt_enter setTitle:@"开始体验" forState:UIControlStateNormal];
        [bt_enter setTitleColor:[UIColor colorWithRed:195/255.0 green:170/255.0 blue:170/255.0 alpha:1.0] forState:UIControlStateNormal];
        bt_enter.layer.cornerRadius = 5.0;
        bt_enter.layer.borderWidth = 2.0;
        bt_enter.layer.borderColor =  [UIColor colorWithRed:195/255.0 green:170/255.0 blue:170/255.0 alpha:1.0].CGColor;
        
        [bt_enter addTarget:self action:@selector(enterApp) forControlEvents:UIControlEventTouchUpInside];
        
        [sv_boot addSubview:bt_enter];
        [self.view addSubview:sv_boot];
        
        [self writeDataPreference:true];
        
        
    } else {
        [self enterApp];
        
    }
    
    
}


/**
 进入app
 */
-(void) enterApp {
    tbc_main = [[MainViewController alloc]init];
    self.app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.app.window.rootViewController = tbc_main;
    
}

// 数据持久化方法
/**
 数据持久化到本地

 @param flag 写入的标志
 */
-(void)writeDataPreference:(BOOL)flag {
    // 1实例化 2 key value 3 同步
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:flag] forKey:@"isFirstEnter"];
    [defaults synchronize];
}

// 读取
-(BOOL)readDataPreference {
    // 实例化 2 value 3 return
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *number = [defaults objectForKey:@"isFirstEnter"];
    return number.boolValue;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
