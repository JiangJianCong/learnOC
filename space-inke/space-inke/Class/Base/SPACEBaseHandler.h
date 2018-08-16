//
//  SPACEBaseHandler.h
//  space-inke
//
//  Created by space on 2018/8/7.
//  Copyright © 2018 space. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 处理完成事件
 */
typedef void(^CompleteBlock)(void);


/**
 处理事件成功
 
 @param obj 返回数据
 */
typedef void(^SuccessBlock)(id obj);


/**
 处理事件失败
 
 @param obj 返回错误信息
 */
typedef void(^FailedBlock)(id obj);

@interface SPACEBaseHandler : NSObject

@end
