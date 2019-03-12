//
//  UIView+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)



/// 获取当前 view 所在的 controller
- (UIViewController *)lc_currentVC {
    
    for (UIView *view = [self superview]; view ; view = view.superview) {
        
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


#pragma mark - ------ xib 相关 ------

/// 快速加载 view 对应的 xib
+ (instancetype)lc_nibWithNibClass:(id)className {
    
    return [[[UINib nibWithNibName:NSStringFromClass([className class]) bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
}



/// 在 xib 中设置 圆角相关属性
- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setMasksToBounds:(BOOL)bounds {
    self.layer.masksToBounds = bounds;
}

- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}




@end
