//
//  ViewController.m
//  K线图绘制
//
//  Created by space on 2018/6/7.
//  Copyright © 2018年 space. All rights reserved.
//
// 1 数据处理 2 k线图绘制
// 1.1 数据加载。1.2 数据解析  1.3 数据归一化
#import "ViewController.h"
#import "StockClass.h"
#import "QuartzChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *array1 = [self loadStockData];
    NSMutableArray *array2 = [self parseStackData:array1];
    NSMutableArray *newStock = [self normalizingData:array2];
    
    QuartzChart *quartz = [[QuartzChart alloc]initWithFrame:self.view.bounds stockData:newStock];
    [self.view addSubview:quartz];
    [quartz setNeedsDisplay];
    

    
//    NSLog(@"%@",array1);
//    NSLog(@"%@",array2);
//    NSLog(@"%@",array3);
    
}


/**
 加载数据

 @return 返回数据列表
 */
-(NSMutableArray *) loadStockData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *stockListStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[stockListStr componentsSeparatedByString:@"\n"]];
    return array;
}


/**
 1.2 解析数据

 @param stockData 传入txt读取的字符串
 @return 返回有stockClass的可变array
 */
-(NSMutableArray *)parseStackData:(NSMutableArray*)stockData{
    NSMutableArray *stockArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<stockData.count - 1; i++) {
        
        NSString *str = [stockData objectAtIndex:i];
        
        NSMutableArray *oneStock = [[NSMutableArray alloc]initWithArray:[str componentsSeparatedByString:@" "]];
        NSString *time = [oneStock objectAtIndex:0];
        NSString *beginPrice = [oneStock objectAtIndex:1];
        NSString *endPrice = [oneStock objectAtIndex:2];
        NSString *maxPrice = [oneStock objectAtIndex:3];
        NSString *minPrice = [oneStock objectAtIndex:4];
        NSString *trade = [oneStock objectAtIndex:5];

        StockClass *oneStk = [[StockClass alloc]init];

        oneStk.time = time;
        oneStk.beginPrice = beginPrice.floatValue;
        oneStk.endPrice = endPrice.floatValue;
        oneStk.maxPrice = maxPrice.floatValue;
        oneStk.minPrice = minPrice.floatValue;
        oneStk.tradeVolume = trade.intValue;
        [stockArray addObject:oneStk];
    }
        return stockArray;
}



/**
 数据归一化

 @param stockData <#stockData description#>
 @return <#return value description#>
 */
-(NSMutableArray *) normalizingData:(NSMutableArray *)stockData {
    float maxPriceAll = 0;
    float minPriceAll = 10000;
    float maxTraceAll = 0;
    float minTraceAll = 10000000;
    for (StockClass *item in stockData) {
        float maxPrice = item.maxPrice;
        float minPrice = item.minPrice;
        int trade = item.tradeVolume;
        if (maxPriceAll  < maxPrice) {
            maxPriceAll = maxPrice;
        }
        if (minPriceAll > minPrice) {
            minPriceAll = minPrice;
        }
        if (maxTraceAll < trade) {
            maxTraceAll = trade;
        }
        if (minTraceAll > trade) {
            minTraceAll = trade;
        }
    }
    
    NSMutableArray *newStock = [[NSMutableArray alloc]init];
    for (StockClass *item in stockData) {
        item.beginPrice = 300*(item.beginPrice - minPriceAll)/(maxPriceAll - minPriceAll);
        item.endPrice = 300*(item.endPrice - minPriceAll)/(maxPriceAll - minPriceAll);
        item.maxPrice = 300*(item.maxPrice - minPriceAll)/(maxPriceAll - minPriceAll);
        item.minPrice = 300*(item.minPrice - minPriceAll)/(maxPriceAll - minPriceAll);
        item.tradeVolume = (item.tradeVolume - minTraceAll)*300 / (maxTraceAll - minTraceAll);
        [newStock addObject:item];
    }
    return newStock;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
