//
//  MyCollectionViewLayout.h
//  UICollectionView瀑布流
//
//  Created by Jones on 10/18/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyCollectionViewLayoutDelegate<NSObject>
-(float)getCellH:(float)width index:(int)index;
@end

@interface MyCollectionViewLayout : UICollectionViewLayout
@property(nonatomic,weak)id<MyCollectionViewLayoutDelegate> delegate;
@end
