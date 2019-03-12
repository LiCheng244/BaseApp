//
//  UITableView+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UITableView+Custom.h"

@implementation UITableView (Custom)


/// 注册 cell
- (void)lc_registerNibName:(Class)cellClass {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}


/// 注册 cell
- (void)lc_registerNibName:(Class)cellClass reuseIdentifier:(NSString *)identifier {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:identifier];
}


/// 重用
- (nullable __kindof UITableViewCell *)lc_dequeueReusableCell:(Class)cellClass {
    
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

@end
