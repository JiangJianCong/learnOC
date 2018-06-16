//
//  AppDelegate.m
//  UIViewController
//
//  Created by space on 2018/6/16.
//  Copyright © 2018 space. All rights reserved.
//

#import "AppDelegate.h"
#define IOS8 [[UIDevice currentDevice].systemVersion doubleValue]>=8
#import "NewViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


// application 启动调用的第一个方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    if (IOS8) {
//        // settings 通知的类型 -> 右上角图标
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
//        // 注册当前的通知
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    }
//
    
    // 1 纯代码添加视图控制器
//    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    NewViewController *vc = [[NewViewController alloc]init];
//
//    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];
//
    
    /*
    // 2 纯界面
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    // 根据name着storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 根据storyboard -> vc
    UIViewController *vc = [storyboard instantiateInitialViewController];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    */
    // 2 纯界面 根据storyboardId
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    // 根据name着storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 根据storyboard -> vc
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"green"];
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    
    
    
    
    return YES;
}

// 失去焦点的时候调用;
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// 进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

// 进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


// 重新获取焦点
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


// 销毁的时候用的方法
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
