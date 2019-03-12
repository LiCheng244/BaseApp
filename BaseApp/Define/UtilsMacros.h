//
//  UtilsMacros.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

// @abstract 工具相关宏

#ifndef UtilsMacros_h
#define UtilsMacros_h


//强弱引用
#define kWeakSelf(type)     __weak typeof(type) weak##type = type;
#define kStrongSelf(type)   __strong typeof(type) type = weak##type;


#pragma mark - ------ 定时器 ------

/// block
#define LC_BLOCK ^()block
#define LC_DISPATCH_AFTER(time, LC_BLOCK) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), LC_BLOCK)



#pragma mark - ------ 打印输出 ------

/// 打印
#ifdef DEBUG
#define NSLog(format, ...) printf("[ %s - %s - %04d行 ]:\n%s\n\n", __TIME__, [[[[NSString stringWithFormat:@"%s", __FILE__] componentsSeparatedByString:@"/"] lastObject] UTF8String],  __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif



#endif
