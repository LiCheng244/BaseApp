//
//  LCPopupController.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "LCPopupController.h"

#import "LCPopupAnimation.h"

@interface LCPopupController ()

@end

@implementation LCPopupController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - ------ UIViewControllerTransitioningDelegate ------

/// 返回一个管理prenent动画过渡的对象
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [[LCPopupAnimation alloc] init];
}


/// 初始化 dismissType
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[LCPopupAnimation alloc] init];
}


@end
