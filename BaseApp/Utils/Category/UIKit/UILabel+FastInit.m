//
//  UILabel+FastInit.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UILabel+FastInit.h"

@implementation UILabel (FastInit)


+ (UILabel *)lc_labelWithText:(NSString *)text
                     fontSize:(CGFloat)fontSize
                    textColor:(UIColor *)textColor
                    alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text          = text;
    label.textColor     = textColor;
    label.font          = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = alignment;
    
    [label sizeToFit];
    
    return label;
}

+ (UILabel *)lc_labelWithText:(NSString *)text {
    return [self lc_labelWithText:text fontSize:16 textColor:[UIColor darkTextColor] alignment:(NSTextAlignmentLeft)];
}

+ (UILabel *)lc_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    return [self lc_labelWithText:text fontSize:fontSize textColor:[UIColor darkTextColor] alignment:(NSTextAlignmentLeft)];
}

+ (UILabel *)lc_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self lc_labelWithText:text fontSize:fontSize textColor:textColor alignment:(NSTextAlignmentLeft)];
}

@end
