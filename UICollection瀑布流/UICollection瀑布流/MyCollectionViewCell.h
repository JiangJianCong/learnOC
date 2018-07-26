//
//  MyCollectionViewCell.h
//  UICollection瀑布流
//
//  Created by space on 2018/7/26.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImage.h"

@interface MyCollectionViewCell : UICollectionViewCell
+(instancetype) createCellWithCollectionView:(UICollectionView*) collectionView indexPath:(NSIndexPath*)indexPath;
-(void) loadData:(MyImage*)mImage;
@end
