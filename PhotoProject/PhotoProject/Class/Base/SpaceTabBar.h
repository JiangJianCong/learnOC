//
//  SpaceTabBar.h
//  PhotoProject
//
//  Created by space on 2018/8/16.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SPACEItemType) {
    SPACEItemTypeTabBBar = 10,
};



@class SpaceTabBar;

typedef void(^TabBlock) (SpaceTabBar * tabbar, SPACEItemType idx);

@protocol SPACETabBarDelegate<NSObject>

-(void) tabbar:(SpaceTabBar *)tabbar clickButton:(SPACEItemType) idx;

@end


@interface SpaceTabBar : UIView

@property(nonatomic, weak) id <SPACETabBarDelegate> delegate;

@property(nonatomic, copy) TabBlock block;

@end
