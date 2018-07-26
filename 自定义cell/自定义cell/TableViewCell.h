//
//  TableViewCell.h
//  自定义cell
//
//  Created by space on 2018/7/25.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
+(instancetype)createCellWithTableView:(UITableView*)tableView;
-(void)loadData:(NSString*)image label:(NSString*)label;
@end
