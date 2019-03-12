//
//  NSString+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Custom)

/**
 版本比较

 @return 0:版本号相等   -1:v1 < newV  1: v1 > newV
 */
- (NSInteger)lc_versionCompare:(NSString *)newV;


/**
 富文本字符串
 
 @param str         字符串
 @param range       富文本位置
 @param color       字体颜色
 */
+ (NSAttributedString *)lc_attrStr:(NSString *)str
                             range:(NSRange)range
                             color:(UIColor *)color;


/**
 字符串计算 size

 @param font        字体
 @param maxW        最大宽度
 */
- (CGSize)lc_sizeWithFont:(UIFont *)font
                     maxW:(CGFloat)maxW;


/**
 字典 转 json字符串
 */
- (NSDictionary *)lc_jsonStrToDict;



@end

NS_ASSUME_NONNULL_END
