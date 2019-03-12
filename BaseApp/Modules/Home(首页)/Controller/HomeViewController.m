//
//  HomeViewController.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeListCell.h"
#import "HomeOneViewController.h"
#import "UpdatePopupController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"游戏";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView lc_registerNibName:[HomeListCell class]];
    [self.view addSubview:self.tableView];
    
    LC_DISPATCH_AFTER(1, ^{
        UpdatePopupController *popup = [UpdatePopupController popupControllerWithTitle:@"xxx" closeBlock:^{}];
        [self presentViewController:popup animated:YES completion:nil];
    });
    
    NSLog(@"lc_timestamp = %lld", [NSDate lc_timestamp]);
    NSLog(@"time = %@",     [NSDate lc_timeWithTimestamp:[NSDate lc_timestamp]]);

    
    NSLog(@"%ld %ld %ld %ld %ld %ld %ld ", [NSDate lc_currYear], [NSDate lc_currMonth],[NSDate lc_currWeek], [NSDate lc_currDay], [NSDate lc_currHour], [NSDate lc_currMinute], [NSDate lc_currSecond]);
}


- (void)lc_navigationBackOnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - ------ UITableViewDelegate ------

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeListCell *cell = [tableView lc_dequeueReusableCell:[HomeListCell class]];
    cell.titleL.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    HomeOneViewController *xx = [[HomeOneViewController alloc] init];
    [self.navigationController pushViewController:xx animated:YES];
}


@end
