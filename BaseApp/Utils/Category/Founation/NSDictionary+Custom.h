//
//  NSDictionary+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Custom)


/**
 将 字典 转成 json 字符串
 */
- (NSString *)lc_dictToJsonStr;

@end

NS_ASSUME_NONNULL_END
