//
//  UIColor+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UIColor+Custom.h"

@implementation UIColor (Custom)


/// 生成随机色
+ (UIColor *)lc_randomColor {
 
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    
    NSLog(@"randomColor: R=%d, G=%d, B=%d", R, G, B);
    UIColor *color = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    return color;
}

/// 16进制颜色
+ (UIColor *)lc_hexColor:(NSString *)hex {
 
    return [self lc_hexColor:hex alpha:1];
}


/// 16进制颜色  带透明度
+ (UIColor *)lc_hexColor:(NSString *)hex alpha:(CGFloat)alpha {
 
    NSString *strs = [hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([strs length] == 3) {
        strs = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                [strs substringWithRange:NSMakeRange(0, 1)],[strs substringWithRange:NSMakeRange(0, 1)],
                [strs substringWithRange:NSMakeRange(1, 1)],[strs substringWithRange:NSMakeRange(1, 1)],
                [strs substringWithRange:NSMakeRange(2, 1)],[strs substringWithRange:NSMakeRange(2, 1)]];
    }
    if([strs length] == 6) {
        strs = [strs stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:strs] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}



@end
