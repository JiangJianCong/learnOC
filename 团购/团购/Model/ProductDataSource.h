//
//  ProductDataSource.h
//  团购
//
//  Created by space on 2018/7/30.
//  Copyright © 2018 space. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductDataSource : NSObject
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle1;
@property(nonatomic, copy) NSString *subtitle2;
@property(nonatomic, copy) NSString *subtitle3;
@property(nonatomic,copy) NSString *saleNum;
@end
