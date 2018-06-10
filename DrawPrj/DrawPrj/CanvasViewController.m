//
//  CanvasViewController.m
//  DrawPrj
//
//  Created by space on 2018/6/10.
//  Copyright © 2018 space. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasView.h"

@interface CanvasViewController ()

@property(nonatomic, strong) CanvasView *canvasView;

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 20, 80, 50);
    [backBtn setImage:[UIImage imageNamed:@"chahao"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    [self.view addSubview:self.canvasView];
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
/**
 返回键
 
 @param sender 传入的返回键
 */
-(void) clickBack:(id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(CanvasView *) canvasView {
    if (!_canvasView) {
        _canvasView = [[CanvasView alloc]initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, self.view.frame.size.height - 130 -20)];
    }
    return _canvasView;
}

@end
