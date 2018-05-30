//
//  MyTextField.m
//  UITextField
//
//  Created by space on 2018/5/29.
//  Copyright © 2018年 space. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2.0;
        self.layer.maskedCorners = 5.0;
        self.delegate = self;
        
    }
    return self;
}

// 开始编辑的时候调用
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    self.layer.borderColor = [UIColor blueColor].CGColor;
}

// 结束编辑的时候调用
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];// 去掉当前空格
    if ([text isEqualToString:@""] || text == nil) {
        self.layer.borderColor = [UIColor redColor].CGColor;
    } else {
        self.layer.borderColor = [UIColor greenColor].CGColor;
    }
    
    
}






@end
