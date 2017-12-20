//
//  PHBaseModel.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/25.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseModel.h"
#import "DTBaseItem.h"

@interface DTBaseItem()

@end

@implementation DTBaseModel

-(instancetype)initWithServerAddress:(NSString *)address {
    self = [super init];
    if(self) {
        self.address = address;
        self.serverAPI = [[DTBaseServerAPI alloc] initWithServer:address];
    }
    return self;
}

-(void)lanuchRequestWithParams:(NSDictionary *)params requestMethod:(PHRequestMethod)method route:(NSString *)api handler:(SuccessHandler)handler {
    self.api = api;
    self.params = params;
    self.method = method;
    if(handler) {
        self.successBlock = handler;
    }
    __weak typeof(self) weakSelf = self;
    [self.serverAPI requestAPI:self.api params:self.params files:nil requestMethod:self.method completionBlock:^(DTBaseServerAPI *response) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf manageResponseData:response];
    }];
}

//交给子类重写即可
-(void)manageResponseData:(DTBaseServerAPI *)response {
    NSLog(@"%@",response);
}

-(void)refreshRequest:(SuccessHandler)handler {
    if(handler) {
        self.successBlock = handler;
    }
    [self lanuchRequestWithParams:self.params requestMethod:self.method route:self.api handler:self.successBlock];
}

-(Class)getCurrentItemClass {
    return [DTBaseItem class];
}

@end
