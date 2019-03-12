//
//  UIImage+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UIImage+Custom.h"

@implementation UIImage (Custom)


#pragma mark - ------ 渐变图片 ------

/// 通用渐变颜色图片
+ (UIImage *)lc_gradualImage {
    
    UIImage *image = [self lc_gradualImageWithFromColor:@"fde545" toColor:@"ffd64c" imgWidth:SCREEN_WIDTH];
    return image;
}


/// 创建渐变颜色图片
+ (UIImage *)lc_gradualImageWithFromColor:(NSString *)fColor
                                  toColor:(NSString *)tColor
                                 imgWidth:(CGFloat)width {
    
    UIColor *color1 = [UIColor lc_hexColor:fColor];
    UIColor *color2 = [UIColor lc_hexColor:tColor];
    
    UIImage *img = [self lc_gradientImageWithBounds:CGRectMake(0, 0, SCREEN_WIDTH, 1)
                                          andColors:@[color1, color2]
                                    andGradientType:1];
    
    return img;
}


/// 创建 渐变图片
+ (UIImage *)lc_gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors andGradientType:(int)gradientType{
    
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    
    switch (gradientType) {
        case 0:
            start = CGPointMake(0.0, 0.0);
            end   = CGPointMake(0.0, bounds.size.height);
            break;
        case 1:
            start = CGPointMake(0.0, 0.0);
            end   = CGPointMake(bounds.size.width, 0.0);
            break;
        default:
            start = CGPointMake(0.0, 0.0);
            end   = CGPointMake(0.0, 0.0);
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}


#pragma mark - ------ 纯色图片 ------

/// 生成纯色图片
+ (UIImage *)lc_pureImageWithColor:(UIColor *)color {
    
    // 图片尺寸
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    UIGraphicsBeginImageContext(rect.size);                 // 填充画笔
    CGContextRef context = UIGraphicsGetCurrentContext();   // 根据所传颜色绘制
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);                       // 联系显示区域
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext(); // 得到图片信息
    UIGraphicsEndImageContext(); //消除画笔
    
    return image;
}


#pragma mark - ------ 获取网络图片尺寸 ------

/// 通过 URL 和给定的宽度 获取网络图片大小
+ (CGSize)lc_getImageSizeWithURL:(id)imageURL width:(CGFloat)mwidth {
    
    if (imageURL == nil) {
        return CGSizeMake(mwidth, 0);
    }
    NSNumber *imgH = [[NSUserDefaults standardUserDefaults] objectForKey:imageURL];
    
    if (!imgH) {
        CGSize imageSize = [self getImageSizeWithURL:imageURL];
        CGFloat imgH = 0;
        if (imageSize.height > 0) {
            imgH = mwidth * imageSize.height / imageSize.width;
        }
        [[NSUserDefaults standardUserDefaults] setObject:@(imgH) forKey:imageURL];
        
        return CGSizeMake(mwidth, imgH);
        
    } else {
        return CGSizeMake(mwidth, [imgH floatValue]);
    }
}


+ (CGSize)getImageSizeWithURL:(id)URL {
    
    NSURL * url = nil;
    if ([URL isKindOfClass:[NSURL class]]) {
        url = URL;
    }
    if ([URL isKindOfClass:[NSString class]]) {
        url = [NSURL URLWithString:URL];
    }
    if (!URL) {
        return CGSizeZero;
    }
    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    CGFloat width = 0, height = 0;
    if (imageSourceRef) {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
        //以下是对手机32位、64位的处理
        if (imageProperties != NULL) {
            CFNumberRef widthNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
#if defined(__LP64__) && __LP64__
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat64Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat64Type, &height);
            }
#else
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat32Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat32Type, &height);
            }
#endif
            CFRelease(imageProperties);
        }
        
        CFRelease(imageSourceRef);
    }
    return CGSizeMake(width, height);
}



@end
