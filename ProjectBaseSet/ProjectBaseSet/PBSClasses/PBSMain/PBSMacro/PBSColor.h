//
//  PBSColor.h
//  ProjectBaseSet
//
//  Created by victor on 16/8/29.
//  Copyright © 2016年 wsl. All rights reserved.
//

#ifndef PBSColor_h
#define PBSColor_h

#pragma--mark---  颜色方法
//十六进制颜色
#define PBSColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//透明度为1
#define PBSColorRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
//自定义透明度
#define PBSColorRGB_alpha(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]


//======================================================
//==========通用颜色方法
//======================================================
#pragma--mark---  通用颜色方法


#define  PBSBgColor   PBSColorFromRGBValue(0Xf5f7fa)










#endif /* PBSColor_h */
