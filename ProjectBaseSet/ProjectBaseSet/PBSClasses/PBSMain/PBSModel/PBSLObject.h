//
//  PBSLObject.h
//  ProjectBaseSet
//
//  Created by victor on 16/9/2.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>


/**对数据进行归档 反归档
 *  //归档
 [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:obj] forKey:@"myObj"];
 [[NSUserDefaults standardUserDefaults] synchronize];
 //反归档
 Person *p = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] dataForKey:@"myObj"]];
 
 所有继承基类PBSLObject的数据模型无需再进行序列化和反序列化就可以进行归档数据了.
 */
@interface PBSLObject : NSObject<NSCoding>



@end

