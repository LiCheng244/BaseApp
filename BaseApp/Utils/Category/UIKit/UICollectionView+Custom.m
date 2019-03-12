//
//  UICollectionViewCell+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UICollectionView+Custom.h"

@implementation UICollectionView (Custom)


- (void)lc_registerHeaderViewWithNibName:(Class)cellClass {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(cellClass)];
}

/// 注册 cell
- (void)lc_registerNibName:(Class)cellClass {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}


/// 注册 cell
- (void)lc_registerNibName:(Class)cellClass reuseIdentifier:(NSString *)identifier {
    
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellWithReuseIdentifier:identifier];
}

@end
