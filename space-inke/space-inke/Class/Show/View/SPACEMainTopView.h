//
//  SPACEMainTopView.h
//  space-inke
//
//  Created by space on 2018/8/6.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface SPACEMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleName:(NSArray *) titles;

@property(nonatomic, copy) MainTopBlock block;

-(void)scrolling:(NSInteger)tag;

@end
