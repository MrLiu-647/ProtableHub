//
//  PHServerAPI.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/25.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseServerAPI.h"

@interface DTBaseServerAPI()

@property (nonatomic,strong) NSURLSessionDataTask *task;

@end

@implementation DTBaseServerAPI

-(instancetype)initWithServer:(NSString *)server {
    self = [super init];
    if(self) {
        if(![server hasPrefix:@"https://"]) {
            server = [@"https://" stringByAppendingString:server];
        }
        if([server hasSuffix:@"/"]) {
            server = [server substringToIndex:server.length - 1];
        }
        self.server = server;
    }
    return self;
}

-(void)requestAPI:(NSString *)api params:(NSDictionary *)params files:(NSDictionary *)files requestMethod:(PHRequestMethod)method completionBlock:(PHServerCompletionBlock)block {
    if(!self.manager) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [self.manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    if(api != nil) {
        if (![api hasPrefix:@"/"]) {
            self.api = [@"/" stringByAppendingString:api];
        } else {
            self.api = api;
        }
    }
    
    //如果任务进行中,便取消网络任务
    if(self.state == PH_STATE_LOADING) {
        [self cancelRequest];
    }
    
    self.method = method;
    self.state = PH_STATE_CREATED;
    self.requestParams = params;
    self.files = files;
    self.userBlock = block;
    
    self.errors = nil;
    self.jsonData = nil;
    self.rawData = nil;
    
    NSString *requestURL = self.server;
    if(self.api != nil) {
        requestURL = [self.server stringByAppendingString:self.api];
    }
    if(method == PH_REQUEST_POST) {
        self.task = [self.manager POST:requestURL parameters:self.requestParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            self.rawData = (NSData *)responseObject;
            self.jsonData = [NSJSONSerialization JSONObjectWithData:self.rawData options:NSJSONReadingAllowFragments error:nil];
            self.state = PH_STATE_SUCCESS;
            
            if(self.userBlock) {
                self.userBlock(self);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            self.errors = error;
            self.state = PH_STATE_FAILED;
        }];
    }
    else {
        self.task = [self.manager GET:requestURL parameters:self.requestParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            self.rawData = (NSData *)responseObject;
            self.jsonData = [NSJSONSerialization JSONObjectWithData:self.rawData options:NSJSONReadingMutableContainers error:nil];
            self.state = PH_STATE_SUCCESS;
            
            if(self.userBlock) {
                self.userBlock(self);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            self.errors = error;
            self.state = PH_STATE_FAILED;
        }];
    }
    self.state = PH_STATE_LOADING;
}

-(void)requestAPI:(NSString *)api params:(NSDictionary *)params files:(NSDictionary *)files completionBlock:(PHServerCompletionBlock)block {
    [self requestAPI:api params:params files:files requestMethod:PH_REQUEST_POST completionBlock:block];
}

-(void)requestAPI:(NSString *)api
           params:(NSDictionary *)params
  completionBlock:(PHServerCompletionBlock)block {
    [self requestAPI:api params:params files:nil requestMethod:PH_REQUEST_POST completionBlock:block];
}

-(void)cancelRequest {
    if(self.state == PH_STATE_LOADING) {
        [self.task cancel];
        self.state = PH_STATE_CANCELLED;
    }
    else {
        NSLog(@"判断错误");
    }
}

-(void)refreshRequest {
    [self requestAPI:self.api params:self.requestParams files:self.files requestMethod:self.method completionBlock:self.userBlock];
}

@end
