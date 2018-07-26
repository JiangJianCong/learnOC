//
//  ViewController.m
//  UICollection瀑布流
//
//  Created by space on 2018/7/26.
//  Copyright © 2018 space. All rights reserved.
//

#import "ViewController.h"
#import "MyImage.h"
#import "MyCollectionViewLayout.h"
#import "MyCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,MyCollectionViewLayoutDelegate> {
    NSMutableArray *sourceData;
    UICollectionView *mcollectionView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sourceData = [[NSMutableArray alloc]init];
    NSArray *array_height = @[@"275",@"300",@"270",@"265",@"270",@"354"];
    for (int i=0; i<6; i++) {
        MyImage *mImage = [[MyImage alloc]init];
        mImage.image = [NSString stringWithFormat:@"%d.jpg",i];
        NSString *height = [array_height objectAtIndex:i];
        mImage.height = height.floatValue;
        mImage.width = 200;
        [sourceData addObject:mImage];
    }
    
    MyCollectionViewLayout *layout = [[MyCollectionViewLayout alloc] init];
    layout.delegate = self; 
    mcollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20) collectionViewLayout:layout];
    mcollectionView.dataSource = self;
    mcollectionView.delegate = self;
    
    
    mcollectionView.backgroundColor = [UIColor whiteColor];
    // 注册
    [mcollectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"space.cv"];
    [self.view addSubview:mcollectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [MyCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    MyImage *item = [sourceData objectAtIndex:indexPath.row];
    [cell loadData:item];
    return cell;
}

- (float)getCellH:(float)width index:(int)index {
    MyImage *item = [sourceData objectAtIndex:index];
    
    NSLog(@"height:%f",width*item.height / item.width);
    return width*item.height / item.width;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
