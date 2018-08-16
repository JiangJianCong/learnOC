//
//  SPACEHotViewController.m
//  space-inke
//
//  Created by space on 2018/8/2.
//  Copyright © 2018 space. All rights reserved.
//

#import "SPACEHotViewController.h"
#import "SPACELiveHandler.h"
#import "SPACELiveCell.h"

static NSString * identifier = @"SPACELiveCell";

@interface SPACEHotViewController ()

@property (nonatomic, strong) NSMutableArray * datalist;

@end

@implementation SPACEHotViewController

- (NSMutableArray *)datalist {
    if (!_datalist) {
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SPACELiveCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.live = self.datalist[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70 + SCREEN_WIDTH;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
}

-(void)initUI {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SPACELiveCell" bundle:nil] forCellReuseIdentifier:identifier];
    
}

-(void) loadData {
    [SPACELiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        [self.datalist addObjectsFromArray:obj];
        [self.tableView reloadData];
        NSLog(@"%@",obj);
        
    } failed:^(id obj) {
        NSLog(@"error: %@", obj);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
