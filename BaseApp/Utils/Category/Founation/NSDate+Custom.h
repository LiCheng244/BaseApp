//
//  NSDate+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Custom)


/**
 判断是否是今天 
 */
- (BOOL)lc_isToday;


/**
 当前 年份
 */
+ (NSInteger)lc_currYear;


/**
 时间戳 年份

 @param tarST       时间戳
 */
+ (NSInteger)lc_targetYear:(long long)tarST;



/**
 当前月份
 */
+ (NSInteger)lc_currMonth;


/**
 时间戳 月份
 
 @param tarST       时间戳
 */
+ (NSInteger)lc_targetMonth:(long long)tarST;



/**
 当前星期
 */
+ (NSInteger)lc_currWeek;


/**
 时间戳 星期
 
 @param tarST       时间戳
 */
+ (NSInteger)lc_targetWeek:(long long)tarST;


/**
 当前天
 */
+ (NSInteger)lc_currDay;

/**
 时间戳 天
 
 @param tarST       时间戳
 */
+ (NSInteger)lc_targetDay:(long long)tarST;


/**
 当前小时
 */
+ (NSInteger)lc_currHour;


/**
 时间戳 小时
 
 @param tarST       时间戳
 */
+ (NSInteger)lc_targetHour:(long long)tarST;



/**
 当前分钟
 */
+ (NSInteger)lc_currMinute;


/**
 时间戳 分钟
 
 @param tarST       时间戳
 */
+ (NSInteger)lc_targetMinute:(long long)tarST;


/**
 当前秒
 */
+ (NSInteger)lc_currSecond;


/**
 时间戳 秒
 
 @param tarST       时间戳
 */
+ (NSInteger)lc_targetSecond:(long long)tarST;



/**
 当前时间戳 毫秒
 */
+ (long long)lc_timestamp;


/**
 将时间戳转换成时间格式
 
 @param timestamp       时间戳
 */
+ (NSString *)lc_timeWithTimestamp:(long long)timestamp;



/**
 获取 yyyy-MM-dd 格式 日期
 */
+ (NSString *)lc_dateWithYMD;


/**
 获取 HH:mm:ss 格式 时间
 */
+ (NSString *)lc_dateWithHms;



/**
 距离当前 多少时间  5分钟前

 @param targetT         目标时间
 */
+ (NSString *)lc_distanceWithNowTime:(long long)targetT;

@end

NS_ASSUME_NONNULL_END
