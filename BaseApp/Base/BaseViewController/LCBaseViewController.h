//
//  LCBaseViewController.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCBaseViewController : UIViewController

#pragma mark - ------ 属性 ------

/// 设置状态栏颜色
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/// tableView
@property (nonatomic, strong) UITableView      *tableView;

/// collectionView
@property (nonatomic, strong) UICollectionView *collectionView;


#pragma mark - ------ 方法 ------
/// 开始刷新
- (void)lc_startRefresh;

/// 头部刷新
- (void)lc_headerRereshing;

/// 尾部刷新
- (void)lc_footerRereshing;

/// 返回按钮
- (void)lc_navigationBackOnClick;

/// 取消网络请求
- (void)lc_cancelRequest;


/// 显示暂无数据视图
- (void)lc_showNoDataViewWithTitle:(NSString *)title;

/// 显示网络加载失败视图
- (void)lc_showNetErrorViewWithTtitle:(NSString *)title
                          reloadBlock:(NullBlock)reloadBlock;

/// 移除加载失败视图
- (void)lc_removeRemindView;


@end

NS_ASSUME_NONNULL_END
