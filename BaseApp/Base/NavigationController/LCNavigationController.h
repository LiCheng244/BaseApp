//
//  LCNavigationController.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCNavigationController : UINavigationController

/**
 *  返回到指定的类视图
 *
 *  @param ClassName    类名
 *  @param animated     是否动画
 */
-(BOOL)lc_popToAppointViewController:(NSString *)ClassName animated:(BOOL)animated;


/**
 *  获得当前导航器显示的视图
 *
 *  @param ClassName    要获取的视图的名称
 *
 *  @return     成功返回对应的对象，失败返回nil;
 */
-(instancetype)lc_getCurrentViewControllerClass:(NSString *)ClassName;

@end

NS_ASSUME_NONNULL_END
