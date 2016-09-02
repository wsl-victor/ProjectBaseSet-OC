//
//  UICountingLabelViewController.m
//  ProjectBaseSet
//
//  Created by victor on 16/9/2.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "UICountingLabelViewController.h"
#import "UICountingLabel.h"
@interface UICountingLabelViewController ()
@property (nonatomic,strong) UICountingLabel *countingLabel;

@end

@implementation UICountingLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.title=@"数字动画效果";
    
    //1. 整数样式数字的变化
    UICountingLabel *label=[[UICountingLabel alloc] initWithFrame:CGRectMake(10, 100, 100, 30)];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont fontWithName:@"Avenir Next" size:28];
    label.textColor=[UIColor colorWithRed:236/255.0 green:66/255.0 blue:43/255.0 alpha:1];
    [self.view addSubview:label];
    //设置格式
    label.format=@"%d";
    [label countFrom:0 to:100 withDuration:1.0f];
    
    
    //2. 浮点数样式数字的变化
    UICountingLabel *oneLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10,140, 160, 30)];
    oneLabel.textAlignment = NSTextAlignmentCenter;
    oneLabel.font = [UIFont fontWithName:@"Avenir Next" size:28];
    oneLabel.textColor = [UIColor colorWithRed:236/255.0 green:66/255.0 blue:43/255.0 alpha:1];
    [self.view addSubview:oneLabel];
    //设置格式
    oneLabel.format = @"%.2f";
    //设置变化范围及动画时间
    [oneLabel countFrom:0.00 to:3198.23 withDuration:1.0f];
    
    //3. 带有千分位分隔符的浮点数样式
    UICountingLabel *twolabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 180, 200, 30)];
    twolabel.textAlignment = NSTextAlignmentCenter;
    twolabel.font = [UIFont fontWithName:@"Avenir Next" size:28];
    twolabel.textColor = [UIColor colorWithRed:236/255.0 green:66/255.0 blue:43/255.0 alpha:1];
    [self.view addSubview:twolabel];
    //设置格式
    twolabel.format = @"%.2f";
    //设置分隔符样式
    twolabel.positiveFormat = @"###,##0.00";
    //设置变化范围及动画时间
    [twolabel countFrom:0.00
                         to:2563048.64
               withDuration:1.0f];
    
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
