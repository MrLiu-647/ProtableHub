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

-(void)lanuchRequestWithParams:(NSDictionary *)params requestMethod:(PHRequestMethod)method route:(NSString *)api {
    self.api = api;
    self.params = params;
    self.method = method;
    __weak typeof(self) weakSelf = self;
    [self.serverAPI requestAPI:self.api params:self.params files:nil requestMethod:self.method completionBlock:^(DTBaseServerAPI *response) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf isNeedToHandleData:response];
    }];
}

-(void)isNeedToHandleData:(DTBaseServerAPI *)response {
    if(response.state == PH_STATE_SUCCESS) {
        if(response.jsonData) {
            [self handleResponseData:response.jsonData];
        }
        else {
            [self handleResponseData:response.rawData];
        }
    }
}

//子类重写,处理Json数据,这里只对简单的嵌套处理了一下
-(void)handleResponseData:(id)response {
    Class type = [response classForCoder];
    
    Class cls = [self getCurrentItemClass];
    id instance = [[cls alloc] init];
    NSMutableDictionary *jsonPath = [instance getJsonPathDic];
    
    if(type == [NSMutableArray class]) {
        for(int i = 0;i < ((NSMutableArray *)response).count;i++) {
            [self handleResponseData:response[i]];
        }
    }
    else if(type == [NSMutableDictionary class]) {
        for (NSString *key in jsonPath) {
            //如果在结果集中找到了和jsonPath中一样的数据,便用KVC赋值
            if([[response allKeys] containsObject:key]) {
                //再判断Dictionary中的数据类型
//                NSLog(@"%@",[response[key] class]);
                [instance setValue:response[key] forKey:key];
            }
            else {
                NSLog(@"没有找到该属性对应的数据");
            }
        }
    }
    else {
        NSLog(@"%@",response);
    }
}

-(Class)getCurrentItemClass {
    return [DTBaseItem class];
}

@end
