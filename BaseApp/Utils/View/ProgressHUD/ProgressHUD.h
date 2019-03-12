//
//  ProgressHUD.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressHUD : NSObject


/// 显示提示框
+ (void)showMessage:(NSString *)message;


/// 显示 loding 框
+ (void)showLoding:(NSString *)message;


/// 隐藏
+ (void)dissmiss;


@end

NS_ASSUME_NONNULL_END
