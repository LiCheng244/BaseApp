//
//  LCNavigationController.m
//  GameBox
//
//  Created by LiCheng on 2019/1/16.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "LCNavigationController.h"

#import "HomeViewController.h"
#import "MineViewController.h"

#define IS_HOME [viewController isKindOfClass:[HomeViewController class]]
#define IS_MINE [viewController isKindOfClass:[MineViewController class]]

@interface LCNavigationController ()<UINavigationControllerDelegate>

@end

@implementation LCNavigationController



#pragma mark - -------------------------------『 System Methods 』-------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
}

/// 第一次加载该类时调用
+ (void)initialize {
    
    /// UINavigationBar
    UINavigationBar *navBar  = [UINavigationBar appearance];
    
    // 背景颜色
    [navBar setBarStyle:(UIBarStyleDefault)];
    [navBar setBackgroundImage:[UIImage lc_pureImageWithColor:[UIColor whiteColor]] forBarMetrics:(UIBarMetricsDefault)];
    
    // 自定义导航栏下面的线
    [navBar setShadowImage:[UIImage imageNamed:@"nav_line"]];
    
    // 是否透明
    [navBar setTranslucent:NO];
    
    // 标题文字
    NSDictionary *barDict = @{ NSForegroundColorAttributeName:[UIColor lc_hexColor:@"ffd64c"],
                               NSFontAttributeName:[UIFont systemFontOfSize:18] };
    [navBar setTitleTextAttributes:barDict];
    
    
    /// UIBarButtonItem
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    // 左右按钮文字
    NSDictionary *itemDict = @{ NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:15] };
    
    [barItem setTitleTextAttributes:itemDict forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:itemDict forState:UIControlStateHighlighted];
}

/// 拦截 push
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


#pragma mark - ------------------------------『 Public Methods 』--------------------------------

/// 返回到指定控制器
- (BOOL)lc_popToAppointViewController:(NSString *)ClassName animated:(BOOL)animated {
    
    id vc = [self lc_getCurrentViewControllerClass:ClassName];
    if (vc != nil && [vc isKindOfClass:[UIViewController class]]) {
        [self popToViewController:vc animated:animated];
        return YES;
    }
    return NO;
}

/// 获得当前导航器显示的视图
- (instancetype)lc_getCurrentViewControllerClass:(NSString *)ClassName {
    
    Class classObj = NSClassFromString(ClassName);
    
    NSArray * szArray =  self.viewControllers;
    for (id vc in szArray) {
        if([vc isMemberOfClass:classObj]) {
            return vc;
        }
    }
    return nil;
}



#pragma mark - ----------------------『 UINavigationControllerDelegate 』------------------------

/// push完成 将要加载页面
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    
    // 隐藏导航栏
//    if (IS_HOME || IS_TASK || IS_MINE) {
//        [self setNavigationBarHidden:YES animated:YES];
//    } else {
//        [self setNavigationBarHidden:NO animated:YES];
//    }
}




@end
