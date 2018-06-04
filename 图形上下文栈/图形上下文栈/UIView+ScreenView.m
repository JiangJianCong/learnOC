//
//  UIView+ScreenView.m
//  图形上下文栈
//
//  Created by space on 2018/6/4.
//  Copyright © 2018年 space. All rights reserved.
//

#import "UIView+ScreenView.h"

@implementation UIView (ScreenView)
-(UIImage*) imageScreenShot {
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    return imageNew;
}
@end
