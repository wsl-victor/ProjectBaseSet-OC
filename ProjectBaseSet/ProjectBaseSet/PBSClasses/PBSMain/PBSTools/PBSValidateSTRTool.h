//
//  PBSValidateSTRTool.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBSValidateSTRTool : NSObject

/**
 *  1.验证邮箱
 *
 *  @param email 邮箱
 *
 *  @return yes or no
 */
+(BOOL)validateEmail:(NSString*)email;

/**
 *  2.验证手机号
 *
 *  @param phono 手机号
 *
 *  @return yes or no
 */
+(BOOL)validatePhonoNum:(NSString *)phono;

/**
 *  3.验证车牌号
 *
 *  @param car 车牌号
 *
 *  @return yes or no
 */
+(BOOL)validateCarNum:(NSString* )car;

/**
 *  4.用户名
 *
 *  @param name 用户名
 *
 *  @return yes or no
 */
+ (BOOL)validateUserName:(NSString*)name ;

/**
 * 5.密码
 *
 *  @param passWord 密码
 *
 *  @return yes or no
 */
+ (BOOL)validatePassword:(NSString*)passWord;
/**
 *  6.昵称
 *
 *  @param nickname 昵称
 *
 *  @return yes or no
 */
+ (BOOL)validateNickname:(NSString*)nickname;



@end
