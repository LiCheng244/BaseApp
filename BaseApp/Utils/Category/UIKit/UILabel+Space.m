//
//  UILabel+Space.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UILabel+Space.h"

@implementation UILabel (Space)

/// 改变 label 行间距
- (void)lc_changeLineSpace:(float)space {
    
    // 真实行间距
    // self.font.lineHeight : 一行字的整体高度，包含上下一点白边
    // self.font.pointSize  : 文字的真实高度
    CGFloat ss = space - (self.font.lineHeight - self.font.pointSize);
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:ss];
    [attr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attr;
    [self sizeToFit];
}

/// 修改 label 字间距
- (void)lc_changeWordSpace:(float)space {
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attr;
    [self sizeToFit];
}

/// 改变 行间距 字间距
- (void)lc_changeLineSpace:(float)lineSpace wordSpace:(float)wordSpace {
    
    CGFloat ss = lineSpace - (self.font.lineHeight - self.font.pointSize);
    NSString *labelText = self.text;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:ss];
    [attr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attr;
    [self sizeToFit];
}



/// 计算 size
- (CGSize)lc_computeSize {

    return [self lc_computeSizeWithLineSpace:0 wordSpace:0];
}


/// 计算 size   要先确保设置了 width
- (CGSize)lc_computeSizeWithLineSpace:(float)lineS
                            wordSpace:(float)wordS {
    
    // 设置高度宽度的最大限度
    CGSize size = CGSizeMake(self.lc_width, MAXFLOAT);
    
    // 计算方式
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading |
    NSStringDrawingTruncatesLastVisibleLine |
    NSStringDrawingUsesLineFragmentOrigin;
    
    // 富文本
    CGFloat ss = lineS - (self.font.lineHeight - self.font.pointSize);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = ss;
    NSDictionary *attributes = @{NSFontAttributeName: self.font,                // 字号
                                 NSParagraphStyleAttributeName: paragraphStyle, // 行间距
                                 NSKernAttributeName: @(wordS) };               // 字间距
    
    CGRect rect = [self.text boundingRectWithSize:size options:options attributes:attributes context:nil];
    
    return CGSizeMake(self.lc_width, rect.size.height);
}

@end
