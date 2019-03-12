//
//  UIImage+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Custom)

#pragma mark - ------------ 渐变图片 ------------

/**
 渐变颜色图片
 */
+ (UIImage *)lc_gradualImage;


/**
 创建渐变颜色图片

 @param fColor      起始颜色     @"ff99dd"
 @param tColor      结束颜色
 @param width       图片宽度
 */
+ (UIImage *)lc_gradualImageWithFromColor:(NSString *)fColor
                                  toColor:(NSString *)tColor
                                 imgWidth:(CGFloat)width;


#pragma mark - ------------ 纯色图片 ------------

/**
 创建纯色图片
 
 @param color       颜色
 */
+ (UIImage *)lc_pureImageWithColor:(UIColor *)color;


#pragma mark - ------------ 网络图片 ------------


/**
 通过 URL 和给定的宽度 获取网络图片大小
 
 @param URL         url
 @param width       宽度
 */
+ (CGSize)lc_getImageSizeWithURL:(id)URL width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
