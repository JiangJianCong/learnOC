//
//  MyCollectionViewCell.m
//  UICollection瀑布流
//
//  Created by space on 2018/7/26.
//  Copyright © 2018 space. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell() {
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation MyCollectionViewCell

+(instancetype) createCellWithCollectionView:(UICollectionView*) collectionView indexPath:(NSIndexPath*)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"space.cv" forIndexPath:indexPath];
    return cell;
    
}

-(void) loadData:(MyImage*)mImage {
    
    self.imageView.image = [UIImage imageNamed:mImage.image];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
