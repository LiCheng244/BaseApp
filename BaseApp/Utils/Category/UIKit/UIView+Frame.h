//
//  UIView+Frame.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)


#pragma mark - -------- 视图位置 --------
/**
 视图 Y 值
 */
@property (nonatomic, assign)CGFloat lc_x;

/**
 视图 Y 值
 */
@property (nonatomic, assign)CGFloat lc_y;

/**
 视图 位置
 */
@property (nonatomic, assign)CGPoint lc_origin;


#pragma mark - -------- 视图大小 --------

/**
 视图 宽度
 */
@property (nonatomic, assign)CGFloat lc_width;

/**
 视图 高度
 */
@property (nonatomic, assign)CGFloat lc_height;

/**
 视图 size
 */
@property (nonatomic, assign)CGSize  lc_size;


#pragma mark - -------- 中心点 --------

/**
 视图 中心点 X
 */
@property (nonatomic, assign)CGFloat lc_centerX;

/**
 视图 中心点 Y
 */
@property (nonatomic, assign)CGFloat lc_centerY;


@end

NS_ASSUME_NONNULL_END
