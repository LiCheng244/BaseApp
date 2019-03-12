//
//  LSWebViewManager.m
//  LSSDK_DEV
//
//  Created by LiCheng on 2017/8/28.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "LCWebViewController.h"
#import <WebKit/WebKit.h>

@interface LCWebViewController () <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) WKWebViewConfiguration *config;   // 配置
@property (nonatomic, strong) WKWebView              *webView;  // webView

@end

@implementation LCWebViewController

#pragma mark - -------------------------------『 System Methods 』-------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadWebView];
}

/// kvo 监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
 
    if ([keyPath isEqualToString:@"title"]) {
        
        if (object == self.webView) {
            self.title = self.webView.title;
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - -----------------------------『 LazyLoding Methods 』-----------------------------

- (WKWebView *)webView {
    
    if(!_webView) {
        
        // 1. 设置网页的配置文件
        _config = [[WKWebViewConfiguration alloc] init];
        _config.allowsInlineMediaPlayback      = YES;  // 允许在线播放
        _config.selectionGranularity           = YES;  // 允许可以与网页交互，选择视图
        _config.suppressesIncrementalRendering = NO;   // 是否支持记忆读取
        
        // 2. 创建 webView
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HEIGHT) configuration:_config];
        _webView.allowsBackForwardNavigationGestures = NO;
        _webView.scrollView.bounces = NO;
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        
        // 3. 监听 title
        [_webView addObserver:self forKeyPath:@"title" options:(NSKeyValueObservingOptionNew) context:NULL];
    }
    return _webView;
}


#pragma mark - ------------------------------『 UILayout Methods 』------------------------------

/// 重写父类返回事件
- (void)lc_navigationBackOnClick {
    
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        
    } else {
        NSArray *vcs = self.navigationController.viewControllers;
        if (vcs.count > 1) {
            if ([vcs objectAtIndex:vcs.count - 1] == self) { // push
                [self.navigationController popViewControllerAnimated:YES];
            }
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

/// 加载 webView
- (void)loadWebView {
    
    // 1. 创建更改数据源,允许更改网页设置
    WKUserContentController *user = [[WKUserContentController alloc] init];
    [user addScriptMessageHandler:self name:@"inviteFriend"];               // 邀请好友
    [user addScriptMessageHandler:self name:@"closeWindow"];                // 关闭窗口
    self.config.userContentController = user;
    
    // 2. 加载 webView
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
    [self.view addSubview:self.webView];
    NSLog(@"webUrl = %@", self.webUrl);
}


#pragma mark - ------------------------------『 Private Methods 』-------------------------------

/// 取消长按效果
- (void)jsCodeWithColseLongPressGesture {
    
    NSString *js1 = @"document.documentElement.style.webkitUserSelect='none';";
    [self.webView evaluateJavaScript:js1 completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"=== 禁止用户选择 : %@",  (error != nil) ? @"error" : @"succ");
    }];
    
    NSString *js2 = @"document.documentElement.style.webkitTouchCallout='none';";
    [self.webView evaluateJavaScript:js2 completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"=== 禁止长按弹出框 : %@",  (error != nil) ? @"error" : @"succ");
    }];
}


#pragma mark - --------------------------『 WKScriptMessageHandler 』----------------------------

/// 监听与 H5 交互
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    // 关闭窗口
//    if ([message.name isEqualToString:@"closeWindow"]) {
//        [self.navigationController popViewControllerAnimated:YES];
//        NSLog(@"closeWindow");
//        return;
//    }
}


#pragma mark - ---------------------------『 WKNavigationDelegate 』-----------------------------

/// 是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    // 客户端接收到服务器的响应头，根据 response 相关信息决定是否跳转
    
    NSString *urlStr = navigationAction.request.URL.absoluteString;

    // 跳转到其他 app
    if ([urlStr hasPrefix:@"mqq://"] ||
        [urlStr hasPrefix:@"weixin://"] ||
        [urlStr hasPrefix:@"wechat://"] ||
        [urlStr hasPrefix:@"alipay://"] ||
        [urlStr hasPrefix:@"itms-services://"] ||
        [urlStr hasPrefix:@"sinaweibo://"]) {
        
        NSURL *url = [NSURL URLWithString:urlStr];
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
        
        // 禁止
        decisionHandler(WKNavigationActionPolicyCancel);
        
        
    } else {
        
        //允许
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

/// 开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"开始加载 = %@", webView.URL.absoluteString);
}


/// 网页加载完成，导航的变化
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
 
    NSLog(@"加载完成");
}

/// 内容加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
    if ([webView.URL.absoluteString isEqualToString:self.webUrl]) {
        
        [self lc_showNetErrorViewWithTtitle:@"内容加载失败" reloadBlock:^{
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
        }];
    }
}

/// 导航跳转失败的时候调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"导航跳转失败");
}


#pragma mark - -------------------------------『 WKUIDelegate 』---------------------------------

/// 提示框
-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:message
                                                            preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的"
                                                     style:(UIAlertActionStyleCancel)
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       completionHandler();
                                                   }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


/// 确认框
-(void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:message
                                                            preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                     style:(UIAlertActionStyleDefault)
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       completionHandler(YES);
                                                   }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:(UIAlertActionStyleCancel)
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             completionHandler(NO);
                                                         }];
    
    [alert addAction:action];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end

