//
//  PBSProgressHud.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "RTSpinKitView.h"
@interface PBSProgressHud : NSObject

+(void)showHudLoadingAnimation:(NSString *)text;


@end
