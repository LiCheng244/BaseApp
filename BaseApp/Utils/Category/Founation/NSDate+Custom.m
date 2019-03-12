//
//  NSDate+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "NSDate+Custom.h"

@implementation NSDate (Custom)

/// 判断是否是今天
- (BOOL)lc_isToday {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | kCFCalendarUnitMinute;
    
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}



/// 当前年份
+ (NSInteger)lc_currYear {

    NSDateComponents *date = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    return [date year];
}

/// 时间戳 年份
+ (NSInteger)lc_targetYear:(long long)tarST {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(tarST/1000)];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:date];
    return [dateComp year];
}

/// 当前月份
+ (NSInteger)lc_currMonth {
    
    NSDateComponents *date = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:[NSDate date]];
    return [date month];
}

/// 时间戳月份
+ (NSInteger)lc_targetMonth:(long long)tarST {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(tarST/1000)];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:date];
    return [dateComp month];
}

/// 当前星期
+ (NSInteger)lc_currWeek {
    
    NSDateComponents *date = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    return [date weekday] - 1;
}

/// 时间戳 星期
+ (NSInteger)lc_targetWeek:(long long)tarST {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(tarST/1000)];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    return [dateComp weekday]-1;
}

/// 当前天
+ (NSInteger)lc_currDay {
    
    NSDateComponents *date = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:[NSDate date]];
    return [date day];
}

/// 时间戳 天
+ (NSInteger)lc_targetDay:(long long)tarST {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(tarST/1000)];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:date];
    return [dateComp day];
}

/// 当前小时
+ (NSInteger)lc_currHour {
    
    NSDateComponents *date = [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:[NSDate date]];
    return [date hour];
}

/// 时间戳 小时
+ (NSInteger)lc_targetHour:(long long)tarST {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(tarST/1000)];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:date];
    return [dateComp hour];
}

/// 当前分钟
+ (NSInteger)lc_currMinute {
    
    NSDateComponents *date = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:[NSDate date]];
    return [date minute];
}

/// 时间戳 分钟
+ (NSInteger)lc_targetMinute:(long long)tarST {
  
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(tarST/1000)];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:date];
    return [dateComp minute];
}

/// 当前秒
+ (NSInteger)lc_currSecond {
    
    NSDateComponents *date = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:[NSDate date]];
    return [date second];
}

/// 时间戳 秒
+ (NSInteger)lc_targetSecond:(long long)tarST {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(tarST/1000)];
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:date];
    return [dateComp second];
}


/// 当前时间戳 毫秒
+ (long long)lc_timestamp {
    
    NSTimeInterval nowtime = [[NSDate date] timeIntervalSince1970] * 1000;
    return [[NSNumber numberWithDouble:nowtime] longLongValue];
}


/// 将时间戳转换成时间格式
+ (NSString *)lc_timeWithTimestamp:(long long)timestamp {
    
    // 格式化时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp / 1000];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}


/// 获取 yyyy-MM-dd 格式日期
+ (NSString *)lc_dateWithYMD {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:[NSDate new]];
    return selfStr;
}

/// 获取 HH:mm:ss 格式 时间
+ (NSString *)lc_dateWithHms {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm:ss";
    NSString *selfStr = [fmt stringFromDate:[NSDate new]];
    return selfStr;
}


/// 目标时间 距离当前时间 多少时间
+ (NSString *)lc_distanceWithNowTime:(long long)targetT {
    

    long long nowST  = [self lc_timestamp];      // 当前时间戳
    NSInteger diffST = (nowST - targetT)/1000;    // 时间差
    
    NSInteger nowYear   = [self lc_targetYear:nowST];
    NSInteger nowMonth  = [self lc_targetMonth:nowST];
    NSInteger nowDay    = [self lc_targetDay:nowST];
    
    NSInteger beYear   = [self lc_targetYear:targetT];
    NSInteger beMonth  = [self lc_targetMonth:targetT];
    NSInteger beDay    = [self lc_targetDay:targetT];
    NSInteger beHour   = [self lc_targetHour:targetT];
    NSInteger beMinute = [self lc_targetMinute:targetT];

    NSString *result;
    if (diffST < 0) {
        result = @"超前时间";
    }

    if (nowYear == beYear) { // 同一年
        
        if (nowMonth == beMonth) { // 同一个月
            
            if (nowDay == beDay) { // 同一天
                
                if (diffST < 60*60) { // 一小内
                    
                    if (diffST < 60) {
                        result = @"刚刚";
                    } else {
                        result = [NSString stringWithFormat:@"%ld分钟前",beMinute];
                    }
                    
                } else {
                    result = [NSString stringWithFormat:@"今天 %02ld:%02ld",beHour, beMinute];
                }
                
            } else { // 不同天
                
                if (diffST < 24*60*60*2) { // 昨天
                    result = [NSString stringWithFormat:@"昨天 %02ld:%02ld", beHour, beMinute];
                } else {
                    result = [NSString stringWithFormat:@"%02ld-%02ld %02ld:%02ld",beMonth, beDay, beHour, beMinute];
                }
            }
            
        } else { // 不同月
            result = [NSString stringWithFormat:@"%02ld-%02ld %02ld:%02ld",beMonth, beDay, beHour, beMinute];
        }
        
    } else { // 不同年
        result = [self lc_timeWithTimestamp:targetT];
    }

    return result;
}

@end
