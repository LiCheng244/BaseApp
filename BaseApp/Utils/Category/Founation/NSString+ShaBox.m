//
//  NSString+ShaBox.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "NSString+ShaBox.h"

@implementation NSString (ShaBox)



/// 沙盒根目录
+ (NSString *)lc_homeDir {
    
    return NSHomeDirectory();
}


/// Documents 目录
+ (NSString *)lc_documentDir {

     return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
}


/// Library 目录
+ (NSString *)lc_libraryDir {
    
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) lastObject];
}


/// caches 目录
+ (NSString *)lc_cachesDir {
    
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject];
}


/// tmp 目录
+ (NSString *)lc_tmpDir {
    
    return NSTemporaryDirectory();
}


/// bundle 目录
+ (NSString *)lc_bundleDir {
    
   return [[NSBundle mainBundle] bundlePath];
}

@end
