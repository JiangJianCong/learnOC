//
//  Mybutton.m
//  UIButton
//
//  Created by space on 2018/5/26.
//  Copyright © 2018年 space. All rights reserved.
//

#import "Mybutton.h"

@implementation Mybutton
-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        
        // border
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
        
        // image
        self.imageView.contentMode = UIViewContentModeCenter; // 使用要小心
        [self setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateHighlighted];
        
        // title
        self.titleLabel.textAlignment =  NSTextAlignmentCenter;
        [self setTitle:@"未选中" forState:UIControlStateNormal];
        [self setTitle:@"选中" forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    }
    return self;
}

/**
 约束图片的位置

 @param contentRect 传进来的是frame属性
 @return 返回的是image对frame的限制属性
 */
-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat w = contentRect.size.height / 2;
    CGFloat h = w;
    CGFloat x = 5;
    CGFloat y = (contentRect.size.height - h) / 2;
    return CGRectMake(x, y, w, h);
}


/**
 title的位置

 @param contentRect <#contentRect description#>
 @return <#return value description#>
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat h = contentRect.size.height / 2;
    CGFloat w = contentRect.size.width - 5 - h;
    CGFloat x = h + 5 + 2;
    CGFloat y = (contentRect.size.height - h) / 2;
    return CGRectMake(x, y, w, h);
}

@end
