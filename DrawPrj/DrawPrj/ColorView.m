//
//  ColorView.m
//  DrawPrj
//
//  Created by space on 2018/6/10.
//  Copyright © 2018 space. All rights reserved.
//

#import "ColorView.h"

@interface ColorView()

@property (nonatomic, strong) NSMutableArray *colors;
@property (nonatomic, strong) UIView *bottomView;

@end


@implementation ColorView

-(instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
    }
    return self;
}

-(void) showAnimation {
    self.hidden = NO;
    __block CGRect rect = self.bottomView.frame;
    [UIView animateWithDuration:0.1 animations:^{
        rect.origin.y = CGRectGetHeight(self.frame) - 125;
        self.bottomView.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
}

-(void) hideAnimation {
    __block CGRect rect = self.bottomView.frame;
    [UIView animateWithDuration:0.1 animations:^{
        rect.origin.y = CGRectGetHeight(self.frame);
        self.bottomView.frame = rect;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hideAnimation];
}

-(UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame), 125)];
        _bottomView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

@end
