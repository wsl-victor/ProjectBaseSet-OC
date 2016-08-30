//
//  PBSBaseViewController.m
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "PBSBaseViewController.h"
#import "PBSLoginViewController.h"
#import "PBSRegisterViewController.h"

@interface PBSBaseViewController ()


@end

@implementation PBSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

/**
 *  需要登录
 */
- (void)showShouldLoginPoint
{
    if (!self.actionSheet) {
        self.actionSheet = [MSAlertController alertControllerWithTitle:@"温馨提示" message:@"只有登录账户才能做此操作" preferredStyle:MSAlertControllerStyleAlert];
        self.actionSheet.titleFont = [UIFont systemFontOfSize:16];
        
        
        self.actionSheet.titleColor = [UIColor colorWithHex:@"#666666"];
        self.actionSheet.messageColor = [UIColor colorWithHex:@"#999999"];
        
        MSAlertAction *action1 = [MSAlertAction actionWithTitle:@"已有账号，立即登录" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
            
           
        }];
        action1.titleColor = [UIColor colorWithHex:@"#275996"];
        action1.font = [UIFont systemFontOfSize:14];
        [self.actionSheet addAction:action1];
        
        MSAlertAction *action2 = [MSAlertAction actionWithTitle:@"没有账号？立即注册" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
            
            
        }];
        action2.font = [UIFont systemFontOfSize:14];
        action2.titleColor = [UIColor colorWithHex:@"#275996"];
        [self.actionSheet addAction:action2];
        
        MSAlertAction *action = [MSAlertAction actionWithTitle:@"暂不登录" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
            return ;
        }];
        action.font = [UIFont systemFontOfSize:14];
        action.titleColor = [UIColor colorWithHex:@"#275996"];
        [self.actionSheet addAction:action];
    }
    
    
    
    [self presentViewController:self.actionSheet animated:YES completion:^{
        
        //        [self.actionSheet dismissViewControllerAnimated:YES completion:^{
        //
        //        }];
    }];

}


/**
 *  显示没有数据页面
 */
-(void)showNoDataImage
{

}

/**
 *  移除无数据页面
 */
-(void)removeNoDataImage
{

}

/**
 *  加载视图
 */
- (void)showLoadingAnimation
{

}


/**
 *  停止加载
 */
- (void)stopLoadingAnimation
{

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
