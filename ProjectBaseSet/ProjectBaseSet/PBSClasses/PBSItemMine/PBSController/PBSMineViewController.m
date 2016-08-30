//
//  PBSMineViewController.m
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "PBSMineViewController.h"
#import "LBToAppStore.h"
@interface PBSMineViewController ()

@end

@implementation PBSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(void)goToAppStore
{
    //用户好评系统
    LBToAppStore *toAppStore = [[LBToAppStore alloc]init];
    toAppStore.myAppID = @"12222222";
    [toAppStore showGotoAppStore:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
