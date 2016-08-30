//
//  UIColor+PBSCommonColor.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PBSCommonColor)
/**
 *  设置颜色
 *
 *  @param hexColor #666666
 *
 *  @return 返回颜色
 */
+ (UIColor *)colorWithHex:(NSString *)hexColor;

@end
