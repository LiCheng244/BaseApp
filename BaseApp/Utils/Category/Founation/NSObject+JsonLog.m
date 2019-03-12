//
//  NSObject+JsonLog.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "NSObject+JsonLog.h"


static inline void sq_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


#pragma mark - --- NSObject 分类 ---

@implementation NSObject (JsonLog)

/// 将obj转换成json字符串。如果失败则返回nil.
- (NSString *)convertToJsonString {
    
    //先判断是否能转化为JSON格式
    if (![NSJSONSerialization isValidJSONObject:self])  return nil;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted  error:&error];
    if (error || !jsonData) return nil;
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end


#pragma mark - ---NSDictionary 分类 ---

@implementation NSDictionary (SQJsonLog)

/// 用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)sqjsonlog_descriptionWithLocale:(id)locale{
    
    NSString *result = [self convertToJsonString];//转换成JSON格式字符串
    if (!result) return [self sqjsonlog_descriptionWithLocale:locale];//如果无法转换，就使用原先的格式
    return result;
}

/// 用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)sqjsonlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *result = [self convertToJsonString];
    if (!result) return [self sqjsonlog_descriptionWithLocale:locale indent:level];
    return result;
}
/// 用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)sqjsonlog_debugDescription{
    
    NSString *result = [self convertToJsonString];
    if (!result) return [self sqjsonlog_debugDescription];
    return result;
}

/// 在load方法中完成方法交换
+ (void)load {
    
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        sq_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(sqjsonlog_descriptionWithLocale:));
        sq_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(sqjsonlog_descriptionWithLocale:indent:));
        sq_swizzleSelector(class, @selector(debugDescription), @selector(sqjsonlog_debugDescription));
    });
}

@end


#pragma mark - --- NSArray 分类 ---

@implementation NSArray (SQJsonLog)

/// 用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)sqjsonlog_descriptionWithLocale:(id)locale{
    
    NSString *result = [self convertToJsonString];
    if (!result) return [self sqjsonlog_descriptionWithLocale:locale];
    return result;
}

/// 用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)sqjsonlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *result = [self convertToJsonString];
    if (!result) return [self sqjsonlog_descriptionWithLocale:locale indent:level];
    return result;
}


/// 用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)sqjsonlog_debugDescription{
    
    NSString *result = [self convertToJsonString];
    if (!result) return [self sqjsonlog_debugDescription];
    return result;
}

+ (void)load {
    
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        sq_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(sqjsonlog_descriptionWithLocale:));
        sq_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(sqjsonlog_descriptionWithLocale:indent:));
        sq_swizzleSelector(class, @selector(debugDescription), @selector(sqjsonlog_debugDescription));
    });
}


@end
