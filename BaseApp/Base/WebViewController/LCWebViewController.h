//
//  LCWebViewController.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "LCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCWebViewController : LCBaseViewController

@property (nonatomic, copy  ) NSString  *webUrl;
@property (nonatomic, assign) BOOL      isProgressBar;

@end

NS_ASSUME_NONNULL_END
