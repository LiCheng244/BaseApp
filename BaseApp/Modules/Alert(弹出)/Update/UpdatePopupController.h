//
//  UpdatePopupController.h
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "LCPopupController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UpdatePopupController : LCPopupController


+ (instancetype)popupControllerWithTitle:(NSString *)title
                              closeBlock:(void (^)(void))close;
@end

NS_ASSUME_NONNULL_END
