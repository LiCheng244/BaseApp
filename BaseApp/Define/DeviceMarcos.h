//
//  DeviceMarcos.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

// @abstract 工具相关宏


#ifndef DeviceMarcos_h
#define DeviceMarcos_h



#pragma mark - ------ 系统判断 ------

/// iOS 8
#define IS_IOS8_Later   [[[[UIDevice lc_systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] integerValue] >= 8
/// iOS 9
#define IS_IOS9_Later   [[[[UIDevice lc_systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] integerValue] >= 9
/// iOS 10
#define IS_IOS10_Later  [[[[UIDevice lc_systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] integerValue] >= 10
/// iOS 11
#define IS_IOS11_Later  [[[[UIDevice lc_systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] integerValue] >= 11
/// iOS 12
#define IS_IOS12_Later  [[[[UIDevice lc_systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] integerValue] >= 12


#pragma mark - ------ 设备信息判断 ------

/// 屏幕最大宽/高
#define SCREEN_MAX_LENGTH   (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
/// iPad
#define IS_IPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
/// iPhone
#define IS_IPHONE           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
/// retina
#define IS_RETINA           ([[UIScreen mainScreen] scale]  >= 2.0)
/// iphone4
#define IS_IPHONE_4         (IS_IPHONE && SCREEN_MAX_LENGTH == 480.0)
/// iphone5
#define IS_IPHONE_5         (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
/// iphone7
#define IS_IPHONE_7         (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
/// iphone7p
#define IS_IPHONE_7P        (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
/// iphoneX
#define IS_IPHONE_X         (SCREEN_WIDTH >=375.0f && SCREEN_HEIGHT >=812.0f && IS_IPHONE)

#define CHILD_VC_COUNT      self.navigationController.childViewControllers.count

#define VIEW_HEIGHT         (CHILD_VC_COUNT > 1) ?SCREEN_HEIGHT-STATUS_NAV_BAR_H: SCREEN_HEIGHT-STATUS_NAV_TAB_BAR_H


#pragma mark - ------ 常用高度 ------

/// 屏幕宽度
#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width
/// 屏幕高度
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
/// 状态栏高度
#define STATUS_BAR_H          [[UIApplication sharedApplication] statusBarFrame].size.height
/// 导航栏高度
#define NAV_BAR_H             44
/// TabBar高度
#define TAB_BAR_H             (CGFloat)((STATUS_BAR_H>20) ? (83.0):(49.0))
/// 导航栏、状态栏高度
#define STATUS_NAV_BAR_H      (CGFloat)(STATUS_BAR_H + NAV_BAR_H)
/// 导航栏、状态栏、tabbar 高度
#define STATUS_NAV_TAB_BAR_H  (CGFloat)(STATUS_BAR_H + NAV_BAR_H + TAB_BAR_H)



#endif
