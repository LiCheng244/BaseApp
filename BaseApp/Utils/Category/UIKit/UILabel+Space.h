//
//  UILabel+Space.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Space)


/**
 改变 label 行间距
 
 @param space           间距离
 */
- (void)lc_changeLineSpace:(float)space;


/**
 修改 label 字间距
 
 @param space           间距离
 */
- (void)lc_changeWordSpace:(float)space;


/**
 改变 行间距 字间距
 
 @param lineSpace       行间距
 @param wordSpace       字间距
 */
- (void)lc_changeLineSpace:(float)lineSpace wordSpace:(float)wordSpace;



/**
 计算 size   要先确保设置了 width
 */
- (CGSize)lc_computeSize;


/**
 计算 size   要先确保设置了 width

 @param lineS           行间距
 @param wordS           字间距
 */
- (CGSize)lc_computeSizeWithLineSpace:(float)lineS
                            wordSpace:(float)wordS;
@end

NS_ASSUME_NONNULL_END


