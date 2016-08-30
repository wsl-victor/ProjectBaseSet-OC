//
//  PBSValidateSTRTool.m
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "PBSValidateSTRTool.h"

@implementation PBSValidateSTRTool


//
//1.验证邮箱

+(BOOL)validateEmail:(NSString*)email{
    
    NSString *emailString = @"[A-Z0-9a-z._% -] @[A-Za-z0-9.-] \\.[A-Za-z]{2,4}";
    
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailString];
    
    return [emailPredicate evaluateWithObject:email];
    
}



//2.验证手机号

+(BOOL)validatePhonoNum:(NSString *)phono{
    
    //手机号以13， 15，17，18开头，八个 \d 数字字符
    
    NSString *phoneString = @"^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$";
    
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneString];
    
    return [phonePredicate evaluateWithObject:phono];
    
}



//3.验证车牌号

+(BOOL)validateCarNum:(NSString* )car{
    
    NSString *carString = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    
    NSPredicate *carPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", carString];
    
    return [carPredicate evaluateWithObject:car];
    
}



//4.用户名

+ (BOOL)validateUserName:(NSString*)name {
    
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    
    BOOL  peopleName = [userNamePredicate evaluateWithObject:name];
    
    return peopleName;
    
}


//5.密码

+ (BOOL)validatePassword:(NSString*)passWord {
    
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    
    NSPredicate*passWordPredicate = [NSPredicate  predicateWithFormat:@"SELF MATCHES%@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:passWord];
    
}




//
//6.昵称

+ (BOOL)validateNickname:(NSString*)nickname  {
    
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    
    NSPredicate*passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",nicknameRegex];
    
    return [passWordPredicate evaluateWithObject:nickname];
    
}



@end
