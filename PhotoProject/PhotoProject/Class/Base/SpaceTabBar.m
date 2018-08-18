//
//  SpaceTabBar.m
//  PhotoProject
//
//  Created by space on 2018/8/16.
//  Copyright © 2018 space. All rights reserved.
//

#import "SpaceTabBar.h"

@interface SpaceTabBar ()

@property(nonatomic, strong) UIImageView * tabbgView;
@property(nonatomic, strong) NSArray * datalist;

@property(nonatomic, strong) UIButton * lastItem;

@end

@implementation SpaceTabBar

- (NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"tab_live", @"tab_me"];
    }
    return _datalist;
}

- (UIImageView *)tabbgView {
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabbgView];
        
        for (NSInteger i = 0; i < self.datalist.count; i++) {
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom];
            
            item.adjustsImageWhenDisabled = NO;
            
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            item.tag = SPACEItemTypeTabBBar + i;
            
            [self addSubview:item];
        }
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width / self.datalist.count;
    
    for (NSInteger i = 0; i < [self subviews].count; i++) {
        UIView * btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - SPACEItemTypeTabBBar)*(width), 0, width, self.bounds.size.height);
        }
    }
    
}

-(void) clickItem:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:button.tag];
    }
    
    !self.block ? : self.block(self, button.tag);
    
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            button.transform = CGAffineTransformIdentity;
        }];
    }];
    
}

@end
