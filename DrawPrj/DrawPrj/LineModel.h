//
//  LineModel.h
//  DrawPrj
//
//  Created by space on 2018/6/10.
//  Copyright © 2018 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LineModel : NSObject

@property (nonatomic, assign) CGMutablePathRef path;
@property (nonatomic, strong) UIColor *color;
@property CGFloat lineWidth;

@end
