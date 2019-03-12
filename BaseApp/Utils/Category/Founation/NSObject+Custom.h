//
//  NSObject+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Custom)

/**
 获取当前类的成员变量列表
 */
+ (NSArray *)lc_objIvars;


/**
 获取当前类的属性列表
 */
+ (NSArray *)lc_objProperties;


@end

NS_ASSUME_NONNULL_END
