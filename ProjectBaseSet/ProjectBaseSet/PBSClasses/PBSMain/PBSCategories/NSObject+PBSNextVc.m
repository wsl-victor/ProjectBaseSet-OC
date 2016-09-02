//
//  NSObject+PBSNextVc.m
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "NSObject+PBSNextVc.h"

@implementation NSObject (PBSNextVc)

+ (UIViewController*)viewControllerWithviewObj:(UIView *)viewObj {
    
    for (UIView* next = [viewObj superview]; next; next =
         next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                          class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

//获取某个view所在的控制器
+(UIViewController *)viewController:(UIView *)viewObj
{
    UIViewController *viewController = nil;
    UIResponder *next = viewObj.nextResponder;
    while (next)
    {
        if ([next isKindOfClass:[UIViewController class]])
        {
            viewController = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    } 
    return viewController;
}

@end
