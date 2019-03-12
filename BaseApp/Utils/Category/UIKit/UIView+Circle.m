//
//  UIView+Circle.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/11.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UIView+Circle.h"

@implementation UIView (Circle)


/// 设置圆角  以高度为准 默认全部圆角
- (void)lc_circle {
    
    [self lc_circleWithRadius:self.lc_height/2 borderWidth:0 borderColor:self.backgroundColor rectCorner:UIRectCornerAllCorners];
}


/// 设置圆角  以高度为准
- (void)lc_circleWithRectCorner:(UIRectCorner)corner {
    
    [self lc_circleWithRadius:self.lc_height/2 borderWidth:0 borderColor:self.backgroundColor rectCorner:corner];

}


/// 设置圆角  默认全部圆角
- (void)lc_circleWithRadius:(CGFloat)radius {
 
    [self lc_circleWithRadius:radius borderWidth:0 borderColor:self.backgroundColor rectCorner:UIRectCornerAllCorners];
}


///  设置圆角
- (void)lc_circleWithRadius:(CGFloat)radius
                 rectCorner:(UIRectCorner)corner {
    
    [self lc_circleWithRadius:radius borderWidth:0 borderColor:self.backgroundColor rectCorner:corner];
}


/// 设置圆角  默认全部圆角
- (void)lc_circleWithRadius:(CGFloat)radius
                borderWidth:(CGFloat)width
                borderColor:(UIColor *)color {
    
    [self lc_circleWithRadius:radius borderWidth:width borderColor:color rectCorner:UIRectCornerAllCorners];
}


/// 设置圆角
- (void)lc_circleWithRadius:(CGFloat)radius
                borderWidth:(CGFloat)width
                borderColor:(UIColor *)color
                 rectCorner:(UIRectCorner)corner {
    
    CGRect rect = CGRectMake(0, 0, self.lc_width - width, self.lc_height - width);
    
    // 圆角
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    
    // 圆边
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = rect;
    borderLayer.lineWidth = width * 2;
    borderLayer.strokeColor = color.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     byRoundingCorners:corner
                                                           cornerRadii:CGSizeMake(radius, radius)];
    
    maskLayer.path   = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    
    [self.layer insertSublayer:borderLayer atIndex:0];
    [self.layer setMask:maskLayer];
    
}


@end
