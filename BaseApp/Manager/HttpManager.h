//
//  NetworkManager.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

// @abstract 网络请求全局管理

#import <Foundation/Foundation.h>

typedef void (^SuccBlock)(id response);
typedef void (^FailBlock)(NSString *eInfo);



NS_ASSUME_NONNULL_BEGIN

@interface HttpManager : NSObject

/// 单例初始化
+ (HttpManager *)manger;


/**
 get 请求

 @param url     请求地址
 @param params  请求参数
 @param fail    失败回调
 @param succ    成功回调
 */
- (void)getWithUrl:(NSString *)url
            params:(_Nullable id)params
              fail:(_Nullable FailBlock)fail
              succ:(SuccBlock)succ;



/**
 get 请求
 
 @param url     请求地址
 @param params  请求参数
 @param fail    失败回调
 @param succ    成功回调
 */
- (void)postWithUrl:(NSString *)url
             params:(_Nullable id)params
               fail:(_Nullable FailBlock)fail
               succ:(SuccBlock)succ;


/**
 取消请求
 */
- (void)cancelRequest;


/**
 检测网络
 */
- (void)reachabilityNetwork;



@end

NS_ASSUME_NONNULL_END
