//
//  MyCollectionViewLayout.m
//  UICollectionView瀑布流
//
//  Created by Jones on 10/18/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "MyCollectionViewLayout.h"
@interface MyCollectionViewLayout(){
    NSMutableArray *attsArray;// cell 约束
    NSMutableArray *itemHeight;// 高度
}
@end
@implementation MyCollectionViewLayout
// 1 初始化
-(void)prepareLayout{
    [super prepareLayout];
    if (attsArray == nil) {
        attsArray = [[NSMutableArray alloc]init];
    }
    if (itemHeight == nil) {
        itemHeight = [[NSMutableArray alloc]init];
    }
    // 获取有多少个item
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0;i<count ; i++) {
        // index section
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 返回 每一个item 约束
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:indexPath];
        [attsArray addObject:att];
    }
}
// 2 设置滚动范围
-(CGSize)collectionViewContentSize{
    return CGSizeMake(0, 0);
}
// 3 renturn 属性数组
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return attsArray;
}
// 4 约束内容
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat collectViewW = self.collectionView.frame.size.width;
    CGFloat w = (collectViewW - 10*4)/3;
    //
    CGFloat h = [self.delegate getCellH:w index:(int)indexPath.item];
    CGFloat x = 10+(indexPath.row%3)*(w+10);
    CGFloat y = 10;
    if (indexPath.row<3) {
        itemHeight[indexPath.row] = [NSNumber numberWithFloat:h];
    }
    if (indexPath.row>=3) {
        NSNumber *num_h = itemHeight[indexPath.row%3];
        y = 20+num_h.floatValue;
    }
    att.frame = CGRectMake(x, y, w, h);
    return att;
}
@end
