//
//  UIColor+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Custom)


/**
 生成随机色
 */
+ (UIColor *)lc_randomColor;


/**
 16进制颜色

 @param hex     16进制字符串 @"xxxxxx"
 */
+ (UIColor *)lc_hexColor:(NSString *)hex;


/**
 16进制颜色  带透明度

 @param hex     16进制字符串 @"xxxxxx"
 @param alpha   透明度
 */
+ (UIColor *)lc_hexColor:(NSString *)hex alpha:(CGFloat)alpha;



@end

NS_ASSUME_NONNULL_END
