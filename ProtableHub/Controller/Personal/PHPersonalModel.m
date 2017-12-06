//
//  PHPersonalModel.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/28.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalModel.h"

//完整的打印Json信息
#ifdef DEBUG
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define SLog(format, ...)
#endif

@implementation PHPersonalModel

+(PHPersonalModel *)sharedInstance {
    static PHPersonalModel *model;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!model) {
            model = [[PHPersonalModel alloc] initWithServerAddress:@"https://github.com"];
        }
    });
    return model;
}
//获取基本信息
-(void)handleResponseData:(id)response {
    if([NSJSONSerialization isValidJSONObject:response]) {
        NSDictionary *dic1 = [self.basicInfo getJsonPathDic];
        NSDictionary *dic2 = [self.detailInfo getJsonPathDic];
        for (NSString *key in dic1) {
            if([[response allKeys] containsObject:dic1[key]]) {
                [self.basicInfo setValue:response[dic1[key]] forKey:key];
                [NSUserDefaults.standardUserDefaults setValue:response[dic1[key]] forKey:key];
            }
        }
        for (NSString *key in dic2) {
            if([[response allKeys] containsObject:dic2[key]]) {
                [self.detailInfo setValue:[[NSString alloc] initWithFormat:@"%@",response[dic2[key]]] forKey:key];
                [NSUserDefaults.standardUserDefaults setValue:response[dic2[key]] forKey:key];
            }
        }
        if(self.successBlock) {
            self.successBlock();
        }
    }
    else {
        self.accessToken = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        [NSUserDefaults.standardUserDefaults setValue:self.accessToken forKey:@"accessToken"];
        self.serverAPI.server = @"https://api.github.com";
        [self lanuchRequestWithParams:nil requestMethod:PH_REQUEST_GET route:[[NSString alloc] initWithFormat:@"/user?%@",self.accessToken] handler:nil];
    }
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(PHPersonalItem *)basicInfo {
    if(!_basicInfo) {
        _basicInfo = [[PHPersonalItem alloc] init];
    }
    return _basicInfo;
}

-(PHPersonalDetailItem *)detailInfo {
    if(!_detailInfo) {
        _detailInfo = [[PHPersonalDetailItem alloc] init];
    }
    return _detailInfo;
}

@end
