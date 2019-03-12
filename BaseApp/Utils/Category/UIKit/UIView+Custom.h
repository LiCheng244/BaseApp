//
//  UIView+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Custom)

/**
 当前 view 所在的 vc
 */
- (UIViewController *)lc_currentVC;



#pragma mark - ------ xib ------


/**
 快速加载 xib
 */
+ (instancetype)lc_nibWithNibClass:(id)className;

/**
 圆角
 */
@property (assign,nonatomic) IBInspectable CGFloat cornerRadius;

/**
 是否剪裁
 */
@property (assign,nonatomic) IBInspectable BOOL    masksToBounds;

/**
 边框宽度
 */
@property (assign,nonatomic) IBInspectable CGFloat borderWidth;

/**
 边框颜色
 */
@property (strong,nonatomic) IBInspectable UIColor *borderColor;


@end

NS_ASSUME_NONNULL_END
