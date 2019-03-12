//
//  NSString+Encryption.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "NSString+Encryption.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Encryption)


/// base64 编码
- (NSString *)lc_base64Encode {
    
    //1、先转换成二进制数据
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    //2、对二进制数据进行base64编码，完成后返回字符串
    return [data base64EncodedStringWithOptions:0];
}


/// base64 解码
- (NSString *)lc_base64Decode {
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    //2、把二进制数据转换成字符串
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


/// md5
- (NSString *)lc_md5 {
    
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

@end
