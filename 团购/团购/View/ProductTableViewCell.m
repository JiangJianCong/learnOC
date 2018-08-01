//
//  ProductTableViewCell.m
//  团购
//
//  Created by space on 2018/7/30.
//  Copyright © 2018 space. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "Util.h"
@interface ProductTableViewCell (){
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle1;
@property (weak, nonatomic) IBOutlet UILabel *subTitle2;
@property (weak, nonatomic) IBOutlet UILabel *subTitle3;
@property (weak, nonatomic) IBOutlet UILabel *saleNum;
@end


@implementation ProductTableViewCell
@synthesize imageView = _imageView;

+(instancetype)createCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"space.tb.cell";
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell" owner:nil options:nil]lastObject];
        
    }
    return cell;
}

-(void)loadData:(ProductDataSource *)product {
    NSString *imagePath = product.image;
    NSString *title = product.title;
    NSString *subTitle1 = product.subtitle1;
    NSString *subTitle2 = product.subtitle2;
    NSString *subTitle3 = product.subtitle3;
    NSString *saleNum = product.saleNum;
    
    self.imageView.image = [UIImage imageNamed:imagePath];
    self.title.text = title;
    self.subTitle1.text = subTitle1;
    self.subTitle1.textColor = [UIColor grayColor];
    self.subTitle1.font = [UIFont systemFontOfSize:10.0];
    
    self.subTitle2.text = subTitle2;
    self.subTitle2.textColor = MY_GREENCOLOR;
    
    self.subTitle3.text = subTitle3;
    self.subTitle3.textColor = [UIColor orangeColor];
    self.subTitle3.font = [UIFont systemFontOfSize:12.0];
    
    self.saleNum.text = saleNum;
    self.saleNum.textColor = [UIColor grayColor];
    self.saleNum.font = [UIFont systemFontOfSize:12.0];
    self.saleNum.textAlignment = NSTextAlignmentLeft;
    
}


 
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
