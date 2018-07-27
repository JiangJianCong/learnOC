//
//  TableViewController.m
//  AutoLayout
//
//  Created by space on 2018/7/27.
//  Copyright © 2018 space. All rights reserved.
//

#import "TableViewController.h"
#import "MyTableViewCell.h"

@interface CellData : NSObject
@property (nonatomic, strong) UIImage* avatar;
@property (nonatomic, strong) NSString* txtName;
@property (nonatomic, strong) NSString* txtContent;

@end

@implementation CellData

@end


@interface TableViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) NSMutableArray* arr;


@end



@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = @[].mutableCopy;
    
    for (int i = 0; i < 10;  i++) {
        CellData* data = [CellData new];
        data.avatar = [UIImage imageNamed:@"pic"];
        data.txtName = [NSString stringWithFormat:@"name_%d", i];
        data.txtContent = [NSString stringWithFormat:@"content_%d", i];
        [self.arr addObject:data];
    }
    
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = nil;
    cell = (MyTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    CellData* data = self.arr[indexPath.row];
    MyTableViewCell* myCell = (MyTableViewCell*)cell;
    
    myCell.imageView.image = data.avatar;
    myCell.lbName.text = data.txtName;
    myCell.lbContent.text = data.txtContent;
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
