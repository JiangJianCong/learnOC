//
//  AClass.m
//  Delegate
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "AClass.h"

@implementation AClass
-(void)myBuyTicket {
    if ([self.Delegate respondsToSelector:@selector(buyTicket)]) {
        [self.Delegate buyTicket];
    }
}
@end
