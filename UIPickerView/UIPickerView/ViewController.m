//
//  ViewController.m
//  UIPickerView
//
//  Created by Jones on 10/16/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>{
    NSArray *array_table;
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
    UIPickerView *mpickerView;
    
    NSString *tableNum;
    NSString *mainFood;
    NSString *fruitFood;
    NSString *drinkFood;

}
@property (weak, nonatomic) IBOutlet UIButton *bt_submit;

@property (weak, nonatomic) IBOutlet UILabel *lab_mainFood;
@property (weak, nonatomic) IBOutlet UILabel *lab_fruitFood;
@property (weak, nonatomic) IBOutlet UILabel *lab_drinkFood;

@end

@implementation ViewController
//     mpickerView.delegate = self;
//     mpickerView.dataSource = self;
//     三个方法
- (void)viewDidLoad {
    [super viewDidLoad];
    array_table = [[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    array1 = @[@"米饭",@"面条",@"窝窝"];
    array2 = @[@"青椒肉丝",@"水晶牛柳",@"娃娃菜"];
    array3 = @[@"可乐",@"绿茶",@"加多宝",@"开水"];
    
    mpickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 414, 200)];
    mpickerView.delegate = self;
    mpickerView.dataSource = self;
    [self.view addSubview:mpickerView];
}
// 组 几个部分
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}
// 每个组 由多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return array_table.count;
    }else if (component == 1){
        return array1.count;
    }else if (component == 2){
        return array2.count;
    }else if (component ==3 ){
        return array3.count;
    }else{
        return 0;
    }
}
// 每个cell的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = nil;
    if (component == 0) {
        str = [array_table objectAtIndex:row];
    }else if (component ==1){
        str = [array1 objectAtIndex:row];
    }else if (component ==2){
        str = [array2 objectAtIndex:row];
    }else if (component ==3){
        str = [array3 objectAtIndex:row];
    }
    
    return str;
}
// 选择某一行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        tableNum = [array_table objectAtIndex:row];
    }else if (component == 1){
        mainFood = [array1 objectAtIndex:row];
    }else if (component == 2){
        fruitFood = [array2 objectAtIndex:row];
    }else if (component == 3){
        drinkFood = [array3 objectAtIndex:row];
    }

}
- (IBAction)foodSubmit:(id)sender {
    [self.bt_submit setTitle:[NSString stringWithFormat:@"第%@桌",tableNum] forState:UIControlStateNormal];
    self.lab_mainFood.text = mainFood;
    self.lab_fruitFood.text = fruitFood;
    self.lab_drinkFood.text = drinkFood;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
