//
//  NetworkManager.m
//  BaseApp
//
//  Created by LiCheng on 2019/3/5.
//  Copyright © 2019 LiCheng. All rights reserved.
//

#import "HttpManager.h"

@interface HttpManager ()

@property (nonatomic, strong) AFHTTPSessionManager *afnManger;
@end

@implementation HttpManager


- (instancetype)init {
  
    self = [super init];
    if (self) {
        self.afnManger = [AFHTTPSessionManager manager];
        self.afnManger.requestSerializer = [AFJSONRequestSerializer serializer];
        self.afnManger.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}


/// 单例模式
static HttpManager *manager = nil;

+ (HttpManager *)manger {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[HttpManager alloc] init];
    });
    return manager;
}


/// get 请求
- (void)getWithUrl:(NSString *)url
            params:(id)params
              fail:(FailBlock)fail
              succ:(SuccBlock)succ {
    
    [self.afnManger GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (succ) {
            succ(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData *errorData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString *result = [[NSString alloc] initWithData:errorData encoding:NSUTF8StringEncoding];
        if (fail) {
            fail(result);
        }
    }];
}


/// post 请求
- (void)postWithUrl:(NSString *)url
             params:(id)params
               fail:(FailBlock)fail
               succ:(SuccBlock)succ {
    
    [self.afnManger POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (succ) {
            succ(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData *errorData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString *result = [[NSString alloc] initWithData:errorData encoding:NSUTF8StringEncoding];
        if (fail) {
            fail(result);
        }
    }];
}


/// 取消请求
- (void)cancelRequest {
  
    if (self.afnManger.tasks.count > 0) {
        NSLog(@"取消请求");
        [self.afnManger.tasks makeObjectsPerformSelector:@selector(cancel)];
    }
}



/// 检测网络
- (void)reachabilityNetwork {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        NSLog(@"AFNetworkReachabilityManager %ld", status);
    }];

}
@end
