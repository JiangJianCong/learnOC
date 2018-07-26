//
//  TableViewCell.m
//  自定义cell
//
//  Created by space on 2018/7/25.
//  Copyright © 2018 space. All rights reserved.
//

#import "TableViewCell.h"
@interface TableViewCell(){
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TableViewCell
@synthesize imageView = _imageView;

+(instancetype)createCellWithTableView:(UITableView*)tableView {
    static NSString *ID = @"space";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil] lastObject];
        
    }
    return cell;
}

-(void) loadData:(NSString*)image label:(NSString*)label {
    self.imageView.image = [UIImage imageNamed:image];
    self.label.text = label;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.backgroundColor = [UIColor redColor];

    // Configure the view for the selected state
}

@end
