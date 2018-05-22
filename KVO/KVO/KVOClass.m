 //
//  KVOClass.m
//  KVO
//
//  Created by space on 2018/5/21.
//  Copyright © 2018年 space. All rights reserved.
//

#import "KVOClass.h"

@implementation KVOClass

-(void) testKVO {
//    1 注册
    self.p1 = [[Person alloc]init];
    [self.p1 setAge:15];
    [self.p1 addObserver:self forKeyPath:@"age" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.p1 setAge:16];
    

}
-(void)dealloc {
    [self.p1 removeObserver:self forKeyPath:@"age"];
}
// 观察
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"我的年龄变化了");
}



@end
