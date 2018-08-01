//
//  StartRateView.h
//  团购
//
//  Created by space on 2018/7/31.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StarRateViewDelegate <NSObject>

-(void)getCurrentScore:(CGFloat)currentScore;

@end

@interface StartRateView : UIView
@property(nonatomic,weak)id<StarRateViewDelegate> delegate;
@end
