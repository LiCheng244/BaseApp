//
//  TestViewController.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/12.
//  Copyright © 2019 LiCheng. All rights reserved.
//

// @abstract <#类的描述#>
// @discussion <#类的功能#>

#import "TestViewController.h"

@interface TestViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TestViewController


#pragma mark - -------------------------------『 System Methods 』-------------------------------

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}



#pragma mark - -----------------------------『 LazyLoding Methods 』-----------------------------


#pragma mark - -------------------------------『 Setter Getter 』--------------------------------


#pragma mark - -----------------------------『 UILayout Methods 』-------------------------------


#pragma mark - ------------------------------『 Private Methods 』-------------------------------


#pragma mark - ------------------------------『 Network Methods 』-------------------------------



#pragma mark - ----------------------------『 UITableViewDelegate 』-----------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


#pragma mark - ---------------------------『 UITableViewDataSource 』----------------------------

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}



#pragma mark - -------------------------『 UICollectionViewDelegate 』---------------------------


#pragma mark - ------------------------『 UICollectionViewDataSource 』--------------------------


#pragma mark - ---------------------------『 UIScrollViewDelegate 』-----------------------------







@end
