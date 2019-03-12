//
//  UIView+Circle.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/11.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Circle)


/**
 设置圆角  以高度为准 默认全部圆角
 */
- (void)lc_circle;


/**
 设置圆角  以高度为准

 @param corner              哪些方向需要圆角
 */
- (void)lc_circleWithRectCorner:(UIRectCorner)corner;



/**
 设置圆角  默认全部圆角

 @param radius              角度
 */
- (void)lc_circleWithRadius:(CGFloat)radius;


/**
 设置圆角

 @param radius              角度
 @param corner              哪些方向需要圆角
 */
- (void)lc_circleWithRadius:(CGFloat)radius
                 rectCorner:(UIRectCorner)corner;



/**
 设置圆角  默认全部圆角
 
 @param radius              角度
 @param width               边框宽
 @param color               边框颜色
 */
- (void)lc_circleWithRadius:(CGFloat)radius
                borderWidth:(CGFloat)width
                borderColor:(UIColor *)color;

/**
 设置圆角  
 
 @param radius              角度
 @param width               边框宽
 @param color               边框颜色
 @param corner              哪些方向需要圆角
 */
- (void)lc_circleWithRadius:(CGFloat)radius
                borderWidth:(CGFloat)width
                borderColor:(UIColor *)color
                 rectCorner:(UIRectCorner)corner;




@end

NS_ASSUME_NONNULL_END
