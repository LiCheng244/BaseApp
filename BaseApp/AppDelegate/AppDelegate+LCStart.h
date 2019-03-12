//
//  AppDelegate+LCStart.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (LCStart)

/// 初始化根控制器
- (void)initRootWindow;

/// 初始化第三方SDK
- (void)initThridSDK;

@end

NS_ASSUME_NONNULL_END
