//
//  UIButton+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Custom)

/**
 block 方式添加点击事件
 
 @param block 点击事件
 */
- (void)lc_addTouchUpInsideBlock:(void(^)(UIButton *btn))block;

@end

NS_ASSUME_NONNULL_END
