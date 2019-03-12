//
//  PortManager.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/12.
//  Copyright © 2019 LiCheng. All rights reserved.
//

// 服务端 接口管理

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PortManager : NSObject


/// 初始化
+ (instancetype)manager;

/// 是否是正式版
@property (nonatomic, assign) BOOL isRelease;

@property (nonatomic, copy, readonly) NSString *apiUrl;     // api 地址
@property (nonatomic, copy, readonly) NSString *h5Url;      // h5 地址


@property (nonatomic, copy, readonly) NSString *secret;         // 签名
@property (nonatomic, copy, readonly) NSString *channel;        // 渠道号

@end

NS_ASSUME_NONNULL_END
