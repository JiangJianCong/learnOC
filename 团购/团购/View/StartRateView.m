//
//  StartRateView.m
//  团购
//
//  Created by space on 2018/7/31.
//  Copyright © 2018 space. All rights reserved.
//

#import "StartRateView.h"
@interface StartRateView() {
    UIView *foreStarView;
    UIView *backStarView;
    CGFloat currentScore;
}
@end
@implementation StartRateView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        foreStarView = [self createView:@"star_yellow.png" frame:CGRectZero];
        backStarView = [self createView:@"star_gray.png" frame:self.bounds];
        [self addSubview:backStarView];
        [self addSubview:foreStarView];
        
        UITapGestureRecognizer *tagGeture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tagGeture.numberOfTapsRequired = 1;// 单击
        [self addGestureRecognizer:tagGeture];
    }
    return self;
}

-(UIView*)createView:(NSString *)imageName frame:(CGRect)frame {
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.clipsToBounds = true;
    view.backgroundColor = [UIColor clearColor];
    for (int i=0; i<5; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i*self.bounds.size.width/5, 0, self.bounds.size.width/5, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleToFill;
        [view addSubview:imageView];
    }
    return view;
}


-(void)tapAction:(UITapGestureRecognizer *)gesture {
    CGPoint tagPoint = [gesture locationInView:self];
    CGFloat x = tagPoint.x;
    CGFloat realStarScore = x/(self.bounds.size.width/5);
    CGFloat startScore = realStarScore;
    currentScore = startScore / 5;
    [self refushUI];
}

-(void)refushUI {
    if (currentScore < 0) {
        currentScore = 0;
    } else if(currentScore > 1) {
        currentScore = 1;
        
    }
    // if 检查delegate方法是否存在
    if ([self.delegate respondsToSelector:@selector(getCurrentScore:)]) {
        [self.delegate getCurrentScore:currentScore];
    }
    
    // 1 动画开始。2动画属性设置。3动画提交
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    foreStarView.frame = CGRectMake(0, 0, self.bounds.size.width*currentScore, self.bounds.size.height);
    [UIView commitAnimations];
}


@end
