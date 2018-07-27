//
//  CitySelectedButton.m
//  团购
//
//  Created by space on 2018/7/27.
//  Copyright © 2018 space. All rights reserved.
//

#import "CitySelectedButton.h"

@implementation CitySelectedButton

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

-(CGRect) titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 50;
    CGFloat h = 44;
    return CGRectMake(x,y, w, h);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = 50;
    CGFloat y = (44-15)/2;
    CGFloat w = 15;
    CGFloat h = 15;
    return CGRectMake(x, y, w, h);
    
}

@end
