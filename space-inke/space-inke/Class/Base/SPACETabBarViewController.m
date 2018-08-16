//
//  SPACETabBarViewController.m
//  space-inke
//
//  Created by space on 2018/8/1.
//  Copyright © 2018 space. All rights reserved.
//

#import "SPACETabBarViewController.h"
#import "SPACETabBar.h"
#import "SPACEBaseNavViewController.h"
#import "SPACELaunchViewController.h"

@interface SPACETabBarViewController ()<SPACETabBarDelegate>

@property(nonatomic, strong) SPACETabBar * spaceTabbar;

@end

@implementation SPACETabBarViewController

-(SPACETabBar *)spaceTabbar {
    if (!_spaceTabbar) {
        _spaceTabbar = [[SPACETabBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _spaceTabbar.delegate = self;
    }
    return _spaceTabbar;
    
}

- (void)tabbar:(SPACETabBar *)tabbar clickButton:(SPACEItemType)idx {
    if (idx != SPACEItemTypeLaunch) {
        self.selectedIndex = idx - SPACEItemTypeLive;
        return;
    }
    
    SPACELaunchViewController * launchVC = [[SPACELaunchViewController alloc]init];
    [self presentViewController:launchVC animated:YES completion:nil];
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载控制器
    [self configViewController];
    
    // 加载tabbar
    [self.tabBar addSubview:self.spaceTabbar];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
}

-(void) configViewController {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"SPACEMainViewController",@"SPACEMeViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        NSString * vcName = array[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc]init];
        SPACEBaseNavViewController * nav = [[SPACEBaseNavViewController alloc]initWithRootViewController:vc];
    
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
