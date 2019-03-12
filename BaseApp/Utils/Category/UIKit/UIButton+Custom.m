//
//  UIButton+Custom.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/8.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UIButton+Custom.h"

@interface UIButton ()

@property (nonatomic, copy) void(^lc_block)(UIButton *);

@end


@implementation UIButton (Custom)

- (void)setLc_block:(void (^)(UIButton *))lc_block {
    objc_setAssociatedObject(self, @selector(lc_block), lc_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIButton *))lc_block {
    return objc_getAssociatedObject(self, @selector(lc_block));
}


- (void)onClick:(UIButton *)btn {
    
    if (self.lc_block) {
        self.lc_block(btn);
    }
}

/// block 方式添加点击事件
- (void)lc_addTouchUpInsideBlock:(void (^)(UIButton *))block {
    
    self.lc_block = block;
    [self addTarget:self action:@selector(onClick:) forControlEvents:(UIControlEventTouchUpInside)];
}

@end
