//
//  SPACETabBar.h
//  space-inke
//
//  Created by space on 2018/8/1.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SPACEItemType) {
    
    SPACEItemTypeLaunch = 10, // 启动直播
    SPACEItemTypeLive = 100, // 展示直播
    SPACEItemTypeMe, // 我的
    
};

@class SPACETabBar;

typedef void(^TabBlock)(SPACETabBar * tabbar, SPACEItemType idx);

@protocol SPACETabBarDelegate <NSObject>

-(void)tabbar:(SPACETabBar *)tabbar clickButton:(SPACEItemType) idx;

@end

@interface SPACETabBar : UIView

@property (nonatomic, weak) id <SPACETabBarDelegate> delegate;

@property (nonatomic, copy) TabBlock block;

@end


