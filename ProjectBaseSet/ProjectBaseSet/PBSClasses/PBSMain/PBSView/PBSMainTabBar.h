//
//  PBSMainTabBar.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/30.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PBSMainTabBar;


@protocol PBSMainTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(PBSMainTabBar *)tabBar;

@end

@interface PBSMainTabBar : UITabBar


@property (nonatomic, weak) id<PBSMainTabBarDelegate> tabBarDelegate;

@end
