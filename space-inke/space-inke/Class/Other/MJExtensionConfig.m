//
//  MJExtensionConfig.m
//  space-inke
//
//  Created by space on 2018/8/8.
//  Copyright © 2018 space. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "SPACECreator.h"
#import "SPACELive.h"

@implementation MJExtensionConfig

+(void)load {
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    
    
    [SPACECreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"description"
                 };
    }];
    
   
    
    // 驼峰转下划线
    [SPACECreator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [SPACELive mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
}

@end
