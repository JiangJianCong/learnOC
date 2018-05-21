//
//  AClass.h
//  Delegate
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BuyTicketDelegate;
@interface AClass : NSObject

@property(nonatomic,weak) id<BuyTicketDelegate> Delegate;//接受委托
-(void)myBuyTicket;

@end

// 1 protocol : @protocol + @end
@protocol BuyTicketDelegate <NSObject>

@optional  //方法不一定实现
-(void) buyTicket;

@end
