//
//  APIConfig.h
//  space-inke
//
//  Created by space on 2018/8/7.
//  Copyright © 2018 space. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

// 信息类服务地址
#define SERVER_HOST @"http://service.ingkee.com"

// 图片服务地址
#define IMAGE_HOST @"http://img2.inke.cn"

// 热门直播
#define API_HotLive @"api/live/gettop"

// 附近的人
#define API_NearLive @"api/live/near_recommend" //?uid=85149891&latitude=40.090562&longitude=116.413353

//广告地址
#define API_Advertise @"advertise/get"

@end
