//
//  AppDelegate+LCStart.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "AppDelegate+LCStart.h"

#import "LCTabBarController.h"



@interface AppDelegate ()


@end


@implementation AppDelegate (LCStart)


/// 初始化跟控制器
- (void)initRootWindow {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    LCTabBarController *tabBarVC = [[LCTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
}

/// 初始化第三方SDK
- (void)initThridSDK {
 
//    [self xx];
}
//
//- (void)xx {
//
//    // 开始监控网络
//    self.reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
//
//    [self.reachability startNotifier];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNetworkStatus) name:kReachabilityChangedNotification object:nil];
//}
//
//- (void)getNetworkStatus {
//
//    NetworkStatus status = [self.reachability currentReachabilityStatus];
//
//    if (status == ReachableViaWiFi) {
//        NSLog(@"wifi");
//    } else if (status == NotReachable) {
//        NSLog(@"网络有问题");
//    }else if (status == ReachableViaWWAN) {
//        NSLog(@"4G");
//    }
//}
//
//// 移除通知
//- (void)dealloc {
//
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [self.reachability stopNotifier];
//    self.reachability = nil;
//}

@end
