//
//  MyDataSource.h
//  团购
//
//  Created by space on 2018/7/30.
//  Copyright © 2018 space. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataSource : NSObject
+(instancetype) getInstance;
-(void)setCityName:(NSString*)str;
-(NSString*)getCityName;

-(void)setHomeData:(NSMutableArray *)array;
-(NSMutableArray *)getHomeData;

@end
