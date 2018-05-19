//
//  MovieInfo.h
//  MovieTicket
//
//  Created by space on 2018/5/19.
//  Copyright © 2018年 space. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInfo : NSObject

@property(nonatomic,copy) NSString *movieName;
@property(nonatomic,copy) NSString *actorName;
@property(nonatomic,copy) NSString *directorName;
@property(nonatomic,copy) NSString *releaseDate;
@property(nonatomic,copy) NSString *movieDuration;

-(id)initWithName:(NSString *)movieName actorName: (NSString *) actorName directorName : (NSString * ) directorName
                 releaseDate:(NSString *)releaseDate movieDuration:(NSString *) movieDuration ;


@end
