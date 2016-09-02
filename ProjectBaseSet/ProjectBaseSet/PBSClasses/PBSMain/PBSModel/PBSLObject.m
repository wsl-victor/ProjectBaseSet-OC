//
//  PBSLObject.m
//  ProjectBaseSet
//
//  Created by victor on 16/9/2.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "PBSLObject.h"
#import <objc/runtime.h>
@implementation PBSLObject

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &ivarCount);
    for (unsigned int i = 0; i < ivarCount; i++) {
        const char *ivar_name = ivar_getName(ivars[i]);
        NSString *key = [NSString stringWithCString:ivar_name encoding:NSUTF8StringEncoding];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        unsigned int ivarCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &ivarCount);
        for (unsigned int i = 0; i < ivarCount; i++) {
            const char *ivar_name = ivar_getName(ivars[i]);
            NSString *key = [NSString stringWithCString:ivar_name encoding:NSUTF8StringEncoding];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}


@end
