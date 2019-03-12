//
//  EnumMacros.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

// @abstract 枚举相关宏


#ifndef EnumMacros_h
#define EnumMacros_h


typedef void (^NullBlock)(void);


#pragma mark - ------ 提醒视图类型 ------
typedef enum {
    
    /// 没有数据
    RemindViewTypeNoData = 1,
    /// 网络错误
    RemindViewTypeNetError = 2,

} RemindViewType;
#endif
