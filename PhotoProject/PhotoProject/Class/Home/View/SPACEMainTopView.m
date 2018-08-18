//
//  SpaceMainTopView.m
//  PhotoProject
//
//  Created by space on 2018/8/6.
//  Copyright © 2018 space. All rights reserved.
//

#import "SpaceMainTopView.h"


@interface SpaceMainTopView ()

@property (nonatomic, strong) UIView * lineVIew;

@property (nonatomic, strong) NSMutableArray * buttons;

@end

@implementation SpaceMainTopView

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titleName:(NSArray *) titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat btnW = self.width / titles.count;
        CGFloat btnH = self.height;
        
        for (NSInteger i = 0; i < titles.count; i ++) {
            
            UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [self.buttons addObject:titleBtn];
            
            NSString *vcName = titles[i];
            
            
            
            // 设置按钮 文字
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            
            // 设置按钮颜色
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            // 设置字体
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            titleBtn.tag = i;
            
            titleBtn.frame = CGRectMake(i * (btnW), 0, btnW, btnH);
            
            // 设置监听
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titleBtn];
            
            if (i == 1) {
                
                CGFloat h = 2;
                CGFloat y = 40;
                
                [titleBtn.titleLabel sizeToFit];
                
                self.lineVIew = [[UIView alloc] init];
                self.lineVIew.backgroundColor = [UIColor whiteColor];
                self.lineVIew.width = titleBtn.titleLabel.width;
                self.lineVIew.height = h;
                
                self.lineVIew.top = y;
                self.lineVIew.centerX = titleBtn.centerX;
                
                [self addSubview:self.lineVIew];
                
            }
            
        }
    }
    return self;
}

-(void)titleClick:(UIButton *) button {
    
    self.block(button.tag);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineVIew.centerX = button.centerX;
    }];
}
-(void)scrolling:(NSInteger)tag {
    
    UIButton * button = self.buttons[tag];

    [UIView animateWithDuration:0.5 animations:^{
        self.lineVIew.centerX = button.centerX;
    }];
}

@end
