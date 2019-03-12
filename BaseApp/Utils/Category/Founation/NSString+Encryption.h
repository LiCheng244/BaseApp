//
//  NSString+Encryption.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encryption)


/**
 base64编码
 */
- (NSString *)lc_base64Encode;


/**
 base64解码
 */
- (NSString *)lc_base64Decode;


/**
  md5
 */
- (NSString *)lc_md5;


@end

NS_ASSUME_NONNULL_END
