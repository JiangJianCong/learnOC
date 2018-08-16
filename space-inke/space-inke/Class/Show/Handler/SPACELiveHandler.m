//
//  SPACELiveHandler.m
//  space-inke
//
//  Created by space on 2018/8/7.
//  Copyright © 2018 space. All rights reserved.
//

#import "SPACELiveHandler.h"
#import "HttpTool.h"
#import "SPACELive.h"

@implementation SPACELiveHandler

+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue]) {
            
            failed(json);
            
        } else {
            // 如果返回正确，则解析数据
            
            NSArray * lives = [SPACELive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);
            
            
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];
}


@end
