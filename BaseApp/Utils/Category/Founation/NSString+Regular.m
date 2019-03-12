//
//  NSString+Regular.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)

/// 判断字符串是否为空
+ (BOOL)lc_isNull:(NSString *)str {
    
    if ([str isKindOfClass:[NSNull class]] ||
        [str isEqualToString:@"<null>"] ||
        [str isEqualToString:@"(null)"] ||
        [str isEqualToString:@"null"] ||
        str.length == 0 ||
        str == NULL ||
        str == nil ) {
        return YES;
    } else {
        return NO;
    }
}

/// 是否是手机号
- (BOOL)lc_isMobile {
    
    if (self == nil || self.length != 11) {
        return NO;
    }
    return [self baseWithRegExp:@"^1[3|4|5|7|8][0-9]\\d{8}$"];
}


/// 是否是邮箱
- (BOOL)lc_isMail {
    
    return [self baseWithRegExp:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}


/// 是否只有中文
- (BOOL)lc_isOnlyChinese {
    
    NSString *moblieRegexp = @"^[\u4e00-\u9fa5]{0,}$";
    return [self baseWithRegExp:moblieRegexp];
}

/// 是否只有数字
- (BOOL)lc_isOnlyNumber {
    
    NSString *moblieRegexp = @"^[0-9]*$";
    return [self baseWithRegExp:moblieRegexp];
}

/// 是否是身份证
- (BOOL)lc_isIDCard {
    
    NSString *idCard = @"";
    if (self.length == 15) {
        idCard = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    } else {
        idCard = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    }
    
    return [self baseWithRegExp:idCard];
}

/// 是否是银行卡号
- (BOOL)lc_isBankCard {
    
    NSString *bankCard = @"^(\\d{16}|\\d{19})$";
    return [self baseWithRegExp:bankCard];
}


- (BOOL)baseWithRegExp:(NSString *)regexp {
    
    if (self.length <= 0 || self == nil) {
        return NO;
    }
    
    if (regexp.length <= 0 || regexp == nil) {
        return NO;
    }
    
    NSPredicate *idCard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexp];
    return [idCard evaluateWithObject:self];
}


@end
