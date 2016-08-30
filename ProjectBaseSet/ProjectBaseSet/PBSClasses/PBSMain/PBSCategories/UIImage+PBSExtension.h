//
//  UIImage+PBSExtension.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/30.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PBSExtension)

/**
 *  根据图片名自动加载适配iOS6\7的图片
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;


@end
