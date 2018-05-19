//
//  main.m
//  MovieTicket
//
//  Created by space on 2018/5/19.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MovieInfo *movieInfo = [[MovieInfo alloc]initWithName:@"派大星" actorName:@"海绵宝宝" directorName:@"蟹老板" releaseDate:@"2018-05-20" movieDuration:@"120分钟"];
        NSLog(@"%@",movieInfo.actorName);
        
    }
    return 0;
}
