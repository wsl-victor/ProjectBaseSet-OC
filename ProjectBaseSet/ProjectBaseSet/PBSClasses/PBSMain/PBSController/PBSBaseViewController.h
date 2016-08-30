//
//  PBSBaseViewController.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSAlertController.h"
@interface PBSBaseViewController : UIViewController
/**
 *  需要登录的提示窗口
 */
@property (nonatomic,strong)MSAlertController *actionSheet;

/**
 *  需要登录
 */
- (void)showShouldLoginPoint;
/**
 *  显示没有数据页面
 */
-(void)showNoDataImage;

/**
 *  移除无数据页面
 */
-(void)removeNoDataImage;

/**
 *  加载视图
 */
- (void)showLoadingAnimation;


/**
 *  停止加载
 */
- (void)stopLoadingAnimation;

@end
