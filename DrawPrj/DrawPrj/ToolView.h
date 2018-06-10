//
//  ToolView.h
//  DrawPrj
//
//  Created by space on 2018/6/10.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolView : UIView
@property (nonatomic, copy) void(^penBlock)(void);
@property (nonatomic, copy) void(^eraserBlock)();
@property (nonatomic, copy) void(^colorBlock)();
@property (nonatomic, copy) void(^undoBlock)();
@property (nonatomic, copy) void(^clearBlock)();
@property (nonatomic, copy) void(^saveBlock)();
@property (nonatomic, copy) void(^sliderBlock)(CGFloat width);

@end
