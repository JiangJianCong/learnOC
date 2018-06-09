//
//  UnBlockView.h
//  DrawPrj
//
//  Created by space on 2018/6/9.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnBlockView : UIView

@property (nonatomic, copy) void(^unblockViewBlock)(UnBlockView *bView, BOOL success);
-(void) reset;
@end
