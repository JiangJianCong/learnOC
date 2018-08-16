//
//  SPACELive.h
//  space-inke
//
//  Created by space on 2018/8/8.
//  Copyright © 2018 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPACECreator.h"

@interface SPACELive : NSObject
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) SPACECreator * creator;
@property (nonatomic, strong) NSString * extendType;
//@property (nonatomic, strong) Extra * extra;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger landscape;
@property (nonatomic, strong) NSArray * like;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, strong) NSString * liveType;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, strong) NSString * otherAddr;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, strong) NSString * subLiveType;
@property (nonatomic, assign) NSInteger version;
@end
