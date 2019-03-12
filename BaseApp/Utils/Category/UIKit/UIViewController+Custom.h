//
//  UIViewController+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Custom)

/**
 获取当前根视图控制器
 */
+ (instancetype)lc_currentVC;

@end

NS_ASSUME_NONNULL_END
