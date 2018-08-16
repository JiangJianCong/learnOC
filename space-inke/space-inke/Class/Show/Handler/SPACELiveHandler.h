//
//  SPACELiveHandler.h
//  space-inke
//
//  Created by space on 2018/8/7.
//  Copyright © 2018 space. All rights reserved.
//

#import "SPACEBaseHandler.h"

@interface SPACELiveHandler : SPACEBaseHandler


/**
 获取热门直播信息

 @param success success
 @param failed failed
 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

@end
