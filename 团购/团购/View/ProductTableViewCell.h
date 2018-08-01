//
//  ProductTableViewCell.h
//  团购
//
//  Created by space on 2018/7/30.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDataSource.h"

@interface ProductTableViewCell : UITableViewCell
+(instancetype)createCellWithTableView:(UITableView *)tableView;
-(void)loadData:(ProductDataSource *)product;

@end
