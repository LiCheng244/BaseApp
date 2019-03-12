//
//  UserInfoManager.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager


/// 单例模式
static UserManager *manager = nil;

+ (UserManager *)manger {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[UserManager alloc] init];
    });
    return manager;
}


@end
