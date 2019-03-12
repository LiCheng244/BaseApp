//
//  LCTabBarController.m
//  GameBox
//
//  Created by LiCheng on 2019/1/16.
//  Copyright © 2019 LiCheng. All rights reserved.
//


#import "LCTabBarController.h"

#import "HomeViewController.h"
#import "MineViewController.h"



@interface LCTabBarController () <UITabBarControllerDelegate>

@property (nonatomic, assign) NSInteger indexFlag;

@end

@implementation LCTabBarController


#pragma mark - -------------------------------『 System Methods 』-------------------------------

/// 第一次加载
+ (void)initialize {
    
    /// UITabBar
    UITabBar *tabBar = [UITabBar appearance];
    
    tabBar.shadowImage     = [UIImage imageNamed:@"tab_line"];  // 顶部阴影图片
    tabBar.backgroundColor = [UIColor whiteColor];              // 背景颜色
    tabBar.backgroundImage = [[UIImage alloc] init];            // 背景图片
    tabBar.translucent     = NO;                                // 背景不透明，可以解决返回界面时 item 跳动问题
    
    /// tabBarItem
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    
    // 正常文字
    NSMutableDictionary *attr                  = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName]                  = [UIFont systemFontOfSize:11];
    attr[NSForegroundColorAttributeName]       = [UIColor blackColor];
    [tabBarItem setTitleTextAttributes:attr forState:(UIControlStateNormal)];
    
    // 选中文字
    NSMutableDictionary *selectAttr            = [NSMutableDictionary dictionary];
    selectAttr[NSFontAttributeName]            = attr[NSFontAttributeName];
    selectAttr[NSForegroundColorAttributeName] = [UIColor redColor];
    [tabBarItem setTitleTextAttributes:selectAttr forState:(UIControlStateSelected)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self addAllChildViewController];
}


#pragma mark - ------------------------------『 UILayout Methods 』------------------------------

/// 添加子控制器
- (void)addAllChildViewController {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildVC:homeVC imgNamed:@"tab_home" selImgNamed:@"tab_home_sel"];
    homeVC.title = @"游戏";
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    [self addChildVC:mineVC imgNamed:@"tab_me" selImgNamed:@"tab_me_sel"];
    mineVC.title = @"我的";
}


#pragma mark - ------------------------------『 Private Methods 』-------------------------------

- (void)addChildVC:(UIViewController *)vc imgNamed:(NSString *)imgName selImgNamed:(NSString *)selImgName {
    
    LCNavigationController *nav = [[LCNavigationController alloc] initWithRootViewController:vc];
    
    nav.tabBarItem.image = [[UIImage imageNamed:imgName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selImgName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [self addChildViewController:nav];
}




#pragma mark - ------------------------『 UITabBarControllerDelegate 』--------------------------

/// 点击监听
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    if (index != self.indexFlag) { // 判断是否是当前选中的
        
        NSMutableArray *array = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                for (UIView *btn1 in btn.subviews) {
                    if ([btn1 isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                        [array addObject:btn1];
                    }
                }
            }
        }
        
        // 缩放动画效果，并回到原位
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.fromValue      = [NSNumber numberWithFloat:0.9];      // 初始伸缩倍数
        animation.toValue        = [NSNumber numberWithFloat:1.1];      // 结束伸缩倍数
        animation.duration       = 0.2;                                 // 执行时间
        animation.repeatCount    = 1;                                   // 执行次数
        animation.autoreverses   = YES;                                 // 完成动画后会回到执行动画之前的状态
        
        UIControl *btn = array[index];
        [btn.layer addAnimation:animation forKey:nil];
        
        self.indexFlag = index;
    }
}

/// 拦截 tabBar 点击
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    // 判断是哪一个
    LCNavigationController *nav = tabBarController.selectedViewController;
    if ([nav isEqual:[tabBarController.viewControllers firstObject]]) {
        
        // 判断再次选中的是否为当前的控制器
        if ([viewController isEqual:nav]) {

            NSLog(@"刷新界面");
            LCBaseViewController *vc = [nav.childViewControllers firstObject];
            [vc lc_startRefresh];
            
            return NO;
        }
    }
    return YES;
}
@end
