//
//  NSString+Regular.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Regular)


/**
 判断字符串是否为空
 */
+ (BOOL)lc_isNull:(NSString *)str;


/**
 是否是手机号
 */
- (BOOL)lc_isMobile;


/**
 是否是邮箱
 */
- (BOOL)lc_isMail;


/**
 是否只有中文
 */
- (BOOL)lc_isOnlyChinese;


/**
 是否只有数字
 */
- (BOOL)lc_isOnlyNumber;


/**
 是否是身份证
 */
- (BOOL)lc_isIDCard;


/**
 是否是银行卡号
 */
- (BOOL)lc_isBankCard;

@end

NS_ASSUME_NONNULL_END
