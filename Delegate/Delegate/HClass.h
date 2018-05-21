//
//  HClass.h
//  Delegate
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AClass.h"

//这里声明了一下协议
@interface HClass : NSObject<BuyTicketDelegate>
-(void)testDelegate;
@end
