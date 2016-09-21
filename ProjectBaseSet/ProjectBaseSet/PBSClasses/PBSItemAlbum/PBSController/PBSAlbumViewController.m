//
//  PBSAlbumViewController.m
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "PBSAlbumViewController.h"

@interface PBSAlbumViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,weak) UITableView *homeTableView;

@property (nonatomic,strong) NSMutableArray *listArr;


@end

@implementation PBSAlbumViewController


-(NSMutableArray *)listArr
{
    if (_listArr==nil) {
        _listArr=[NSMutableArray array];
    }
    return _listArr;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self createinitArr];
    [self createInitView];
}


#pragma -mark- 初始化视图
-(void)createInitView
{
    
    UITableView *homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, PBSMainWidth , PBSMainHeight) style:UITableViewStylePlain];
    homeTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    homeTableView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    homeTableView.dataSource=self;
    homeTableView.delegate=self;
    [self.view addSubview:homeTableView];
    self.homeTableView=homeTableView;
}


-(void)createinitArr
{
    NSArray *ar=@[@"数字动画效果",
                  @"RSA加密"];
    
    [self.listArr addObjectsFromArray:ar];
}


#pragma -mark-  UITableViewDataSource,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"indexCell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"indexCell"];
    }
    
    cell.textLabel.text=self.listArr[indexPath.row];
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
      
    }else if(indexPath.row==1){
        
    }
}


@end
