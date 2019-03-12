//
//  TimerManager.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "TimerManager.h"

@implementation TimerManager


/// 单例模式
static TimerManager *manager = nil;

+ (TimerManager *)manger {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[TimerManager alloc] init];
    });
    return manager;
}


@end
