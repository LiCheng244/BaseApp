//
//  UpdatePopupController.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/7.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "UpdatePopupController.h"

@interface UpdatePopupController ()
@property (weak, nonatomic) IBOutlet UIView *alertBgV;

@end

@implementation UpdatePopupController


+ (instancetype)popupControllerWithTitle:(NSString *)title
                              closeBlock:(void (^)(void))close {
 
    UpdatePopupController *alert = [[UpdatePopupController alloc] init];
    alert.transitioningDelegate  = alert;
    alert.modalPresentationStyle = UIModalPresentationCustom;
    return alert;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.alertBgV lc_circleWithRadius:10 borderWidth:1 borderColor:[UIColor redColor]];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
