//
//  UIBarButtonItem+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UIBarButtonItem+Custom.h"

@implementation UIBarButtonItem (Custom)


/// 添加导航栏按钮
+ (UIBarButtonItem *)lc_barButtonWithImgName:(NSString *)imgName
                                      target:(id)target
                                      action:(SEL)action {
    
    UIImage *img = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return [[UIBarButtonItem alloc] initWithImage:img
                                            style:(UIBarButtonItemStylePlain)
                                           target:target
                                           action:action];
}


/// 添加导航栏按钮
+ (UIBarButtonItem *)lc_barButtonWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action {
    
    return [[UIBarButtonItem alloc] initWithTitle:title
                                            style:UIBarButtonItemStyleDone
                                           target:target
                                           action:action];
}

@end
