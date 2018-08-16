//
//  SPACELiveCell.m
//  space-inke
//
//  Created by space on 2018/8/8.
//  Copyright © 2018 space. All rights reserved.
//

#import "SPACELiveCell.h"

@interface SPACELiveCell()

@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;




@end


@implementation SPACELiveCell

- (void)setLive:(SPACELive *)live {
    
    _live = live;
    
    [self.headView downloadImage:live.creator.portrait placeholder:@"default_room"];
    
    [self.bigImageView downloadImage:live.creator.portrait placeholder:@"default_room"];
    
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onlineLabel.text = [@(live.onlineUsers) stringValue];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headView.layer.cornerRadius = 25;
    self.headView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
