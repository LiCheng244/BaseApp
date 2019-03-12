//
//  MineViewController.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "MineViewController.h"
#import "LCWebViewController.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
    // 圆角 测试
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:(CGRectMake(10, 100, 80, 80))];
    imgV.image = [UIImage imageNamed:@"test"];
    imgV.backgroundColor = [UIColor yellowColor];
    UIRectCorner corner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
    [imgV lc_circleWithRadius:10 borderWidth:1 borderColor:[UIColor yellowColor] rectCorner:corner];
    [self.view addSubview:imgV];

    
    // 获取高度 测试
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"大师傅好搜啊发大师傅好搜啊发大师傅好搜啊发大师傅好搜啊发";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.lc_width = 200;
    [label lc_changeLineSpace:5 wordSpace:3];
    CGSize size = [label lc_computeSizeWithLineSpace:5 wordSpace:3];
    label.frame = CGRectMake(100, 100, size.width, size.height);
    [self.view addSubview:label];
    
    
    LCWebViewController *webVC = [[LCWebViewController alloc] init];
    webVC.webUrl = @"http://gb.yyyx.com/home.html";
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

@end
