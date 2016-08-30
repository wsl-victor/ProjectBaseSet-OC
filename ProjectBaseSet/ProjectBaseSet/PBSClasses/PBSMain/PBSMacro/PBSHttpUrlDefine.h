//
//  PBSHttpUrlDefine.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#ifndef PBSHttpUrlDefine_h
#define PBSHttpUrlDefine_h

#define Net_ENVIRONMENT 0

#if  Net_ENVIRONMENT == 0

/**
 *  域名
 *
 *  @return 正式环境
 */

#define Net_PBSHOST_URL      @""
#define Net_PBSHOST_PIC_URL  @""


#elif  Net_ENVIRONMENT == 1

/**
 *  域名
 *
 *  @return 开发环境
 */

#define Net_PBSHOST_URL      @""
#define Net_PBSHOST_PIC_URL  @""



#elif  Net_ENVIRONMENT == 2

/**
 *  域名
 *
 *  @return 测试环境
 */

#define Net_PBSHOST_URL      @""
#define Net_PBSHOST_PIC_URL  @""


#endif



#endif /* PBSHttpUrlDefine_h */
