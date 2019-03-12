//
//  HomeOneViewController.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "HomeOneViewController.h"

#import "LCWebViewController.h"

@interface HomeOneViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation HomeOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    
    self.statusBarStyle = UIStatusBarStyleLightContent;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    LC_DISPATCH_AFTER(5, ^{
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)lc_navigationBackOnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 
    [self lc_removeRemindView];
}


#pragma mark - ------ UITableViewDelegate ------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxx"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"xxx"];
        cell.textLabel.text = @"xxxxx";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    LCWebViewController *webVC = [[LCWebViewController alloc] init];
    LCNavigationController *nav = [[LCNavigationController alloc] initWithRootViewController:webVC];
    webVC.webUrl = @"https://www.baidu.com";
    [self presentViewController:nav animated:YES completion:nil];
}


@end
