//
//  SpaceTabBarViewController.m
//  PhotoProject
//
//  Created by space on 2018/8/16.
//  Copyright © 2018 space. All rights reserved.
//

#import "SpaceTabBarViewController.h"
#import "SpaceTabBar.h"
#import "SpaceBaseNavViewController.h"
#import "SpaceBaseViewController.h"

@interface SpaceTabBarViewController () <SPACETabBarDelegate>

@property(nonatomic, strong) SpaceTabBar * spaceTabBar;

@end

@implementation SpaceTabBarViewController

- (SpaceTabBar *)spaceTabBar {
    if (!_spaceTabBar) {
        NSInteger height = 44;
        if (@available(iOS 11.0, *)) {
            height = 83;
        }
        _spaceTabBar = [[SpaceTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
        _spaceTabBar.delegate = self;
    }
    return _spaceTabBar;
}

/**
 代理方法

 @param tabbar tabbarItem
 @param idx 目标id
 */
- (void)tabbar:(SpaceTabBar *)tabbar clickButton:(SPACEItemType)idx {
    NSLog(@"%lu",(unsigned long)idx);
    self.selectedIndex = idx - SPACEItemTypeTabBBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self configViewController];
    
    [self.tabBar addSubview:self.spaceTabBar];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
    
    
}

-(void) configViewController {
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"SpaceMainViewController", @"SpaceMeViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        NSString * vcName = array[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        
        SpaceBaseNavViewController * nav = [[SpaceBaseNavViewController alloc]initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
    }
    NSLog(@"%@",array);
    self.viewControllers = array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
