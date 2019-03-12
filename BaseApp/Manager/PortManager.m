//
//  PortManager.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/12.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "PortManager.h"

@implementation PortManager

static PortManager *Instance = nil;

// 初始化
+ (instancetype)manager {
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        Instance = [[PortManager alloc] init];
    });
    return Instance;
}


- (NSString *)secret {
    return @"6b8b954715bf72a2ce30e83d85b4d5e6";
}

- (NSString *)channel {
    return @"0";
}


- (NSString *)apiUrl {
    
    if (!self.isRelease) {
        return @"http://api.uuui.cn/";
    } else {
        return @"http://ddapi.youxiguancha.com/";
    }
}

- (NSString *)h5Url {
    
    if (!self.isRelease) {
        return @"http://m.uuui.cn/";
    } else {
        return @"http://ddm.youxiguancha.com/";
    }
}

@end
