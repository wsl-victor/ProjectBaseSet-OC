//
//  PBSOtherTool.h
//  ProjectBaseSet
//
//  Created by victor on 16/9/2.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBSOtherTool : NSObject

/**
 *  1获取磁盘空间大小
 *
 *  @return
 */
+ (CGFloat)diskOfAllSizeMBytes;
/**
 * 2磁盘可用空间
 *
 *  @return
 */
+ (CGFloat)diskOfFreeSizeMBytes;
/**
 *  3获取文件大小=获取指定路径下某个文件的大小
 *
 *  @param filePath  文件路径
 *
 *  @return
 */
+ (long long)fileSizeAtPath:(NSString *)filePath;
/**
 *  4获取文件夹下所有文件的大小//获取文件夹下所有文件的大小
 *
 *  @param folderPath
 *
 *  @return
 */
+ (long long)folderSizeAtPath:(NSString *)folderPath;
/**
 *  5//获取字符串(或汉字)首字母
 *
 *  @param string
 *
 *  @return
 */
+ (NSString *)firstCharacterWithString:(NSString *)string;

/**
 *6.获取当前时间
 *
 *  @param NSString
 *
 *  @return //format: @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"
 */
+ (NSString *)currentDateWithFormat:(NSString *)format;



@end
