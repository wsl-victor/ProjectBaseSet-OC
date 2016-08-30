//
//  UIImageView+CornerRadius.h
//  MyPractise
//
//  Created by lzy on 16/3/1.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 
 http://zyden.vicp.cc/zycornerradius/
 
 
 #pragma notification --- 本工具提供两种使用方式，UIImageView+CornerRadius较方便，若不喜欢使用Category方式则可以使用ZYImageView。
 
 
 #pragma mark - 圆形
 UIImageView *imageView = [[UIImageView alloc] initWithRoundingRectImageView];
 [imageView setFrame:CGRectMake(130, 80, 150, 150)];
 [self.view addSubview:imageView];
 
 
 UIImageView *imageViewSecond = [[UIImageView alloc] initWithCornerRadiusAdvance:20.f rectCornerType:UIRectCornerBottomLeft | UIRectCornerTopRight];
 [imageViewSecond setFrame:CGRectMake(130, 280, 150, 150)];
 [self.view addSubview:imageViewSecond];
 
 
 UIImageView *imageViewThird = [[UIImageView alloc] initWithFrame:CGRectMake(130, 480, 150, 150)];
 [imageViewThird zy_cornerRadiusAdvance:20.f rectCornerType:UIRectCornerBottomRight | UIRectCornerTopLeft];
 [imageViewThird zy_attachBorderWidth:5.f color:[UIColor blackColor]];
 [self.view addSubview:imageViewThird];
 
 
 #pragma mark - setImage anytime
 imageView.image = [UIImage imageNamed:@"mac_dog"];
 imageViewSecond.image = [UIImage imageNamed:@"mac_dog"];
 imageViewThird.image = [UIImage imageNamed:@"mac_dog"];

 */
@interface UIImageView (CornerRadius)


- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)zy_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

- (void)zy_cornerRadiusRoundingRect;

- (void)zy_attachBorderWidth:(CGFloat)width color:(UIColor *)color;

@end

