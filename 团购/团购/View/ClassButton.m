//
//  ClassButton.m
//  团购
//
//  Created by space on 2018/7/30.
//  Copyright © 2018 space. All rights reserved.
//

#import "ClassButton.h"
@interface ClassButton(){
    CGRect imageRect;
    CGRect titleRect;
}
@end

@implementation ClassButton

-(id)initWithFrame:(CGRect)frame imageFrame:(CGRect)imageFrame titleFrame:(CGRect) titleFrame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageRect = imageFrame;
        titleRect = titleFrame;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(CGRect) titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = titleRect.origin.x;
    CGFloat y = titleRect.origin.y;
    CGFloat w = titleRect.size.width;
    CGFloat h = titleRect.size.height;
    return CGRectMake(x,y, w, h);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = imageRect.origin.x;
    CGFloat y = imageRect.origin.y;
    CGFloat w = imageRect.size.width;
    CGFloat h = imageRect.size.height;
    return CGRectMake(x, y, w, h);
    
}


@end
