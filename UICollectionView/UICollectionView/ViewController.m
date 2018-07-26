//
//  ViewController.m
//  UICollectionView
//
//  Created by space on 2018/7/26.
//  Copyright © 2018 space. All rights reserved.
//
// UICollectionView = UITableView + cell 非固定
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource> {
    NSMutableArray *array_color;
    UIColor *color_copy;
    UICollectionView *mcollectionView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array_color = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        [array_color addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]];
        
    }
    
    // 完成实例化
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // item size
    layout.itemSize = CGSizeMake(130, 130);
    
    // 头部
    layout.headerReferenceSize = CGSizeMake(414, 50);
    
    layout.footerReferenceSize = CGSizeMake(414, 20);
    
    // 方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    mcollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    mcollectionView.delegate = self;
    mcollectionView.dataSource = self;
    [mcollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"space"];
    [mcollectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"spacehead"];
    [mcollectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"spacefoot"];
    
    [self.view addSubview:mcollectionView];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelong:)];
    [mcollectionView addGestureRecognizer:longPress];
}

-(void) handlelong:(UILongPressGestureRecognizer*) longPress {
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:{
            // 表明点击在什么位置
            NSIndexPath *indexPath = [mcollectionView indexPathForItemAtPoint:[longPress locationInView:mcollectionView]];
            if (indexPath == nil) {
                break;
            }
            [mcollectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged: {
            // 更新
            [mcollectionView updateInteractiveMovementTargetPosition:[longPress locationInView:mcollectionView]];
        }
            break;
        case UIGestureRecognizerStateEnded: {
            // 关闭当前移动
            [mcollectionView endInteractiveMovement];
            
        }
            break;
        default:
            [mcollectionView cancelInteractiveMovement];
            break;
    }
}

// 组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 2 每组 item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return array_color.count;
}

// 3 item 内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"space" forIndexPath:indexPath];
    UIColor *color = [array_color objectAtIndex:indexPath.row];
    cell.backgroundColor = color;
    return cell;
}

// 4 head foot
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"spacehead" forIndexPath:indexPath];
        if (headerView == nil) {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor redColor];
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"spacefoot" forIndexPath:indexPath];
        if (footView == nil) {
            footView = [[UICollectionReusableView alloc] init];
            
        }
        footView.backgroundColor = [UIColor blueColor];
        return footView;
    } else {
        return nil;
    }
}

// 5 选中 删除
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    // 删除
    [array_color removeObjectAtIndex:indexPath.row];
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

//// 6 复制
//// 6.1 长按 菜单 6.2 使能  6.3 操作
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return true;
//}
//
//// 6.2 使能复制和咱贴
//- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
//    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] ||
//        [NSStringFromSelector(action) isEqualToString:@"paste:"]) {
//        
//        return true;
//    }
//    return false;
//}
//// 6.3 操作
//- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
//    if ([NSStringFromSelector(action) isEqualToString:@"copy:"]) {
//        color_copy = [array_color objectAtIndex:indexPath.row];
//    } else if ([NSStringFromSelector(action) isEqualToString:@"paste:"]){
//        if (color_copy != nil) {
//            [array_color insertObject:color_copy atIndex:indexPath.row];
//            color_copy = nil;
//            [collectionView insertItemsAtIndexPaths:@[indexPath]];
//        }
//    }
//}

// 7 item 任意位置拖动
// 7.1 item 使能 7.2 刷新 7.3 手势控制
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    id obj = [array_color objectAtIndex:sourceIndexPath.item];
    [array_color removeObject:obj];
    [array_color insertObject:obj atIndex:destinationIndexPath.item];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
