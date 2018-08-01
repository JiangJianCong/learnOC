//
//  ItemViewController.h
//  团购
//
//  Created by space on 2018/7/30.
//  Copyright © 2018 space. All rights reserved.
//

#import "BaseViewController.h"
#import "ProductDataSource.h"

@interface ItemViewController : BaseViewController
@property(nonatomic, strong)ProductDataSource *itemDataSource;
@end
