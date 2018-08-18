//
//  SpaceBaseHandler.h
//  PhotoProject
//
//  Created by space on 2018/8/18.
//  Copyright © 2018 space. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompleteBlock) (void);

typedef void(^SuccessBlock) (id obj);

typedef void(^FailedBlock) (id obj);

@interface SpaceBaseHandler : NSObject

@end
