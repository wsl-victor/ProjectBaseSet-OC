//
//  UIImage+PBSExtension.m
//  ProjectBaseSet
//
//  Created by victor on 16/8/30.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "UIImage+PBSExtension.h"

@implementation UIImage (PBSExtension)


+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if (iOS7) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}


@end
