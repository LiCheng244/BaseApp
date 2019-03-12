//
//  UIViewController+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UIViewController+Custom.h"

@implementation UIViewController (Custom)


/// 获取当前根视图控制器
+ (instancetype)lc_currentVC {
    
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

@end
