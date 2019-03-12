//
//  UITableView+Custom.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Custom)


/**
 注册 cell
 
 @param cellClass       cell 类
 */
- (void)lc_registerNibName:(Class)cellClass;



/**
 注册 cell
 
 @param cellClass       cell 类
 @param identifier      标示
 */
- (void)lc_registerNibName:(Class)cellClass reuseIdentifier:(NSString *)identifier;



/**
 重用
 */
- (nullable __kindof UITableViewCell *)lc_dequeueReusableCell:(Class)cellClass;


@end

NS_ASSUME_NONNULL_END
