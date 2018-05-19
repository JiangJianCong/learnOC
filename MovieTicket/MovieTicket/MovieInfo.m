//
//  MovieInfo.m
//  MovieTicket
//
//  Created by space on 2018/5/19.
//  Copyright © 2018年 space. All rights reserved.
//

#import "MovieInfo.h"

@implementation MovieInfo



/**
 默认构造函数

 @return self
 */
-(id) init {
    self = [super init];
    if (self) {
        NSLog(@"构造函数");
        self.movieName = @"电影名字";
        self.actorName = @"演员名字";
        self.directorName = @"导演名字";
        self.releaseDate = @"上映日期";
        self.movieDuration = @"电影时长";
    }
    return self;
}

/**
 自定义构造函数

 @param movieName 电影名字
 @param actorName 主演名字
 @param directorName 导演名字
 @param releaseDate 上瘾日期
 @param movieDuration 电影时长
 @return 返回结果
 */
-(id)initWithName:(NSString *)movieName actorName: (NSString *) actorName directorName : (NSString * ) directorName
       releaseDate:(NSString *)releaseDate movieDuration:(NSString *) movieDuration {
    self = [super init];
    if (self) {
        NSLog(@"构造方法");
        self.movieName = movieName;
        self.actorName = actorName;
        self.directorName = directorName;
        self.releaseDate = releaseDate;
        self.movieDuration = movieDuration;
    }
    return self;
}

@end
