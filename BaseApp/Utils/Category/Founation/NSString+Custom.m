//
//  NSString+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)


/// 版本比较
- (NSInteger)lc_versionCompare:(NSString *)newV {
    
    // 都为空  --  相等
    if (!self && !newV) {
        return 0;
    }
    
    // v1为空 v2不会空  --  v1 < v2
    if(!self && newV) {
        return -1;
    }
    
    // v2为空 v1 不为空  -- v1 > v2
    if (self && !newV) {
        return 1;
    }
    
    NSArray *v1Arr = [self componentsSeparatedByString:@"."];
    NSArray *v2Arr = [newV componentsSeparatedByString:@"."];
    
    NSInteger smallCount = (v1Arr.count > v2Arr.count) ? v2Arr.count : v1Arr.count;
    
    for (int i = 0; i < smallCount; i++) {
        
        NSInteger value1 = [v1Arr[i] integerValue];
        NSInteger value2 = [v2Arr[i] integerValue];
        
        if (value1 > value2) {
            // v1版本字段大于v2版本字段，返回1
            return 1;
            
        } else if (value1 < value2) {
            // v2版本字段大于v1版本字段，返回-1
            return -1;
        }
        
        // 版本相等，继续循环。
    }
    
    // 版本可比较字段相等，则字段多的版本高于字段少的版本。
    if (v1Arr.count > v2Arr.count) {
        return 1;
    } else if (v1Arr.count < v2Arr.count) {
        return -1;
    } else {
        return 0;
    }
    
    return 0;
}


/// 富文本字符串
+ (NSAttributedString *)lc_attrStr:(NSString *)str range:(NSRange)range color:(UIColor *)color {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    return [attributedStr copy];
}



/// 字符串计算 size
- (CGSize)lc_sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW {
    
    if (font == nil) {
        font = [UIFont systemFontOfSize:15];
    }
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 0;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    attrs[NSParagraphStyleAttributeName] = paraStyle;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    CGSize size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    return size;
}




///  将 json字符串 转成 字典
- (NSDictionary *)lc_jsonStrToDict {
    
    if (self == nil) {
        return nil;
    }
    
    NSError *error;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    return dic;
}
@end
