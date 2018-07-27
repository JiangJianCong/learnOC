//
//  MyTableViewCell.h
//  AutoLayout
//
//  Created by space on 2018/7/27.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbContent;

@end
