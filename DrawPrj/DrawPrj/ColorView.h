//
//  ColorView.h
//  DrawPrj
//
//  Created by space on 2018/6/10.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView : UIView

@property (nonatomic, copy) void(^selectColorBlock)(UIColor *color);

-(void) showAnimation;

@end
