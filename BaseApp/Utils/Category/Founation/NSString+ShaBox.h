//
//  NSString+ShaBox.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ShaBox)



/**
 沙盒根目录
 */
+ (NSString *)lc_homeDir;


/**
 Documents 目录
 */
+ (NSString *)lc_documentDir;


/**
 Library 目录
 */
+ (NSString *)lc_libraryDir;



/**
 caches 目录
 */
+ (NSString *)lc_cachesDir;


/**
 tmp 目录
 */
+ (NSString *)lc_tmpDir;



/**
 bundle 目录
 */
+ (NSString *)lc_bundleDir;


@end

NS_ASSUME_NONNULL_END
