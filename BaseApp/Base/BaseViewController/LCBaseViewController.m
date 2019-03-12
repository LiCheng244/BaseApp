//
//  LCBaseViewController.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

// @abstract 基类


#import "LCBaseViewController.h"

@interface LCBaseViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *noDataV;

@property (nonatomic, copy) void(^reloadBlock)(void);
@property (nonatomic, copy  ) NSString *detail;

@end

@implementation LCBaseViewController


#pragma mark - -------------------------------『 System Methods 』-------------------------------

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupLeftBarButtonItem];
    [self setupLeftSlidingBackRecognizer];
}

/// 设置状态栏
- (UIStatusBarStyle)preferredStatusBarStyle {
    return _statusBarStyle;
}

- (void)dealloc {
    
    [self lc_cancelRequest];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - -------------------------------『 Public Methods 』-------------------------------

/// 开始刷新
- (void)lc_startRefresh {
    
    if ([self.view.subviews containsObject:self.tableView]) {
        [self.tableView.mj_header beginRefreshing];
    }
    
    if ([self.view.subviews containsObject:self.collectionView]) {
        [self.collectionView.mj_header beginRefreshing];
    }
}

/// 返回
- (void)lc_navigationBackOnClick {
    
}

/// 头部刷新
- (void)lc_headerRereshing {
    
}

/// 尾部刷新
- (void)lc_footerRereshing {
    
}

/// 取消网络请求
- (void)lc_cancelRequest {
#warning 没有实现
}

/// 显示暂无数据视图
- (void)lc_showNoDataViewWithTitle:(NSString *)title {
    
    self.detail = title;
    
    if (_noDataV != nil) {
        NSLog(@"已经加载");
        return;
    }
    [self setupRemindViewWithType:(RemindViewTypeNoData)];
}

/// 显示网络加载失败视图
- (void)lc_showNetErrorViewWithTtitle:(NSString *)title
                          reloadBlock:(NullBlock)reloadBlock {
    
    self.reloadBlock = reloadBlock;
    self.detail = title;
    
    if (_noDataV != nil) {
        NSLog(@"已经加载");
        return;
    }
    [self setupRemindViewWithType:(RemindViewTypeNetError)];
}

/// 移除加载失败视图
- (void)lc_removeRemindView {
    
    if (_noDataV != nil) {
        [self.noDataV removeFromSuperview];
        self.noDataV = nil;
    } else {
        NSLog(@"没有视图，不能移除");
    }
}


#pragma mark - -----------------------------『 LazyLoding Methods 』-----------------------------

/// tableView
- (UITableView *)tableView {
    
    if(!_tableView) {
        
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HEIGHT);
        _tableView = [[UITableView alloc] initWithFrame:rect style:(UITableViewStylePlain)];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);   // 分割线位置
        _tableView.estimatedRowHeight = 0;                          // cell 预设高度
        _tableView.estimatedSectionFooterHeight = 0;                // footer 预设高度
        _tableView.estimatedSectionHeaderHeight = 0;                // header 预设高度
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollsToTop = YES;
        _tableView.tableFooterView = [[UIView alloc] init];
        
        // 头部刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(lc_headerRereshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        [header setTitle:@"下拉刷新" forState:(MJRefreshStateIdle)];
        [header setTitle:@"松开刷新" forState:(MJRefreshStatePulling)];
        [header setTitle:@"刷新中..." forState:(MJRefreshStateRefreshing)];
        
        _tableView.mj_header = header;
        
        // 尾部刷新
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(lc_footerRereshing)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStateIdle)];
        [footer setTitle:@"没有更多数据" forState:(MJRefreshStateNoMoreData)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStatePulling)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStateRefreshing)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStateWillRefresh)];
        _tableView.mj_footer = footer;
    }
    return _tableView;
}

/// collectionView
- (UICollectionView *)collectionView {
    
    if(!_collectionView) {
        
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HEIGHT);
        _collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flow];
        _collectionView.scrollsToTop = YES;
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(lc_headerRereshing)];
        header.lastUpdatedTimeLabel.hidden = YES;
        [header setTitle:@"下拉刷新" forState:(MJRefreshStateIdle)];
        [header setTitle:@"松开刷新" forState:(MJRefreshStatePulling)];
        [header setTitle:@"刷新中..." forState:(MJRefreshStateRefreshing)];
        _collectionView.mj_header = header;
        
        // 尾部刷新
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(lc_footerRereshing)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStateIdle)];
        [footer setTitle:@"没有更多数据" forState:(MJRefreshStateNoMoreData)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStatePulling)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStateRefreshing)];
        [footer setTitle:@"加载更多" forState:(MJRefreshStateWillRefresh)];
        _collectionView.mj_footer = footer;
    }
    return _collectionView;
}


#pragma mark - -------------------------------『 Setter Getter 』--------------------------------

/// 设置状态栏
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    
    _statusBarStyle = statusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}


#pragma mark - ------------------------------『 UILayout Methods 』------------------------------

/// 设置左按钮
-(void)setupLeftBarButtonItem {
    
    // 按钮
    UIImage *image = [[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [button setImage:image forState:(UIControlStateNormal)];
    [button setImage:image forState:(UIControlStateHighlighted)];
    [button addTarget:self action:@selector(backOnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    // 调整位置
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentVerticalAlignment   = UIControlContentVerticalAlignmentCenter;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 20);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 0);
    
    // 显示返回按钮
    NSInteger vcCount = self.navigationController.viewControllers.count;
    if(vcCount > 1 || self.navigationController.presentingViewController != nil) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
}

/// 设置左滑返回手势
- (void)setupLeftSlidingBackRecognizer {
    
    // 获取事件处理对象
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    
    // 获取委托对象里的处理方法
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    
    // 添加全屏手势
    UIScreenEdgePanGestureRecognizer *panGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:target action:handler];
    panGesture.edges = UIRectEdgeLeft;//左侧
    panGesture.delegate = self; // 设置手势代理，拦截手势触发
    
    [self.view addGestureRecognizer:panGesture];
    
    // 一定要禁止系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

/// 设置提醒视图样式
- (void)setupRemindViewWithType:(RemindViewType)type {
    
    // 背景
    _noDataV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HEIGHT)];
    _noDataV.backgroundColor = [UIColor lc_hexColor:@"f4f5f7"];
    
    // 图片
    NSString *imgName = (type == RemindViewTypeNoData) ? @"remind_nodata" : @"remind_error";
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    imgV.lc_centerX = _noDataV.lc_centerX;
    imgV.lc_centerY = _noDataV.lc_centerY-80;
    [_noDataV addSubview:imgV];
    
    // 文字
    CGFloat titleY = CGRectGetMaxY(imgV.frame) + 20;
    UILabel *titleL = [[UILabel alloc] initWithFrame:(CGRectMake(0, titleY, SCREEN_WIDTH, 25))];
    titleL.text = self.detail;
    titleL.font = [UIFont systemFontOfSize:16];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = [UIColor lc_hexColor:@"bfbfbf"];
    [_noDataV addSubview:titleL];
    
    // 按钮
    CGFloat reloadBtnY = CGRectGetMaxY(titleL.frame) + 40;
    UIButton *reloadBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    reloadBtn.frame = CGRectMake((SCREEN_WIDTH-140)/2, reloadBtnY, 140, 36);
    [reloadBtn setBackgroundColor:[UIColor lc_hexColor:@"dbdbdb"]];
    [reloadBtn setTitle:@"刷新试试" forState:(UIControlStateNormal)];
    [reloadBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [reloadBtn addTarget:self action:@selector(reloadOnClick) forControlEvents:(UIControlEventTouchUpInside)];
    reloadBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [reloadBtn lc_circle];
    [_noDataV addSubview:reloadBtn];
    reloadBtn.hidden = (type == RemindViewTypeNoData) ? YES : NO;
    
    [self.view addSubview:self.noDataV];
    [self.view bringSubviewToFront:self.noDataV];
}

/// 返回按钮
- (void)backOnClick {
    
    if ([self respondsToSelector:@selector(lc_navigationBackOnClick)]) {
        [self lc_navigationBackOnClick];
        
    } else {
        
        NSArray *vcs = self.navigationController.viewControllers;
        if (vcs.count > 1) {
            if ([vcs objectAtIndex:vcs.count - 1] == self) { // push
                [self.navigationController popViewControllerAnimated:YES];
            }
        } else { // pre
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

/// 提醒视图刷新回调
- (void)reloadOnClick {
    
    if (self.reloadBlock) {
        self.reloadBlock();
    }
}



#pragma mark - -----------------------『 UIGestureRecognizerDelegate 』--------------------------

/// 防止只有一个vc时触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    
    // 处理特殊控制器
    //    for (UIViewController *vc in self.navigationController.childViewControllers) {
    //        return NO;
    //    }
    
    // 处理 根视图控制器
    return self.navigationController.childViewControllers.count == 1 ? NO : YES;
}



@end
