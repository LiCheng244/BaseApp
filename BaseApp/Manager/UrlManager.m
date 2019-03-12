//
//  ConfigManager.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UrlManager.h"

@implementation UrlManager


/// 单例模式
static UrlManager *manager = nil;

+ (UrlManager *)manger {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[UrlManager alloc] init];
    });
    return manager;
}


@end
