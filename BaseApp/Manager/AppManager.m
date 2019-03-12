//
//  AppManager.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager

/// 单例模式
static AppManager *manager = nil;

+ (AppManager *)manger {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[AppManager alloc] init];
    });
    return manager;
}

@end
