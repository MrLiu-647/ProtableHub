//
//  PHPageModel.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/7.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPageModel.h"

@implementation PHPageModel

+(DTBaseModel *)sharedInstance {
    static DTBaseModel *model;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[PHPageModel alloc] init];
    });
    return model;
}

-(void)getDataWithApi:(NSString *)api dataClass:(Class)className handler:(ResponseBlock)responseBlock {
    self.phBlock = responseBlock;
    NSMutableString *tempApi = [api mutableCopy];
    if([tempApi containsString:@"{/other_user}"]) {
        [tempApi deleteCharactersInRange:[tempApi rangeOfString:@"{/other_user}"]];
    }
    
    if(!self.serverAPI) {
        self.serverAPI = [[DTBaseServerAPI alloc] init];
    }
    self.serverAPI.server = tempApi;
    
    if([className isEqual:[PHPageItem class]]) {
        [self.followerInfo removeAllObjects];
    }else if([className isEqual:[PHFollowingItem class]]) {
        [self.followingInfo removeAllObjects];
    }else {
        [self.repoInfo removeAllObjects];
    }
    
    __weak typeof(self) weakSelf = self;
    [self.serverAPI requestAPI:nil
                        params:nil
                         files:nil
                 requestMethod:PH_REQUEST_GET
               completionBlock:^(DTBaseServerAPI *response) {
                   [weakSelf assignDataFromDataWithClass:className data:response.jsonData];
                   weakSelf.phBlock();
    }];
}

-(void)assignDataFromDataWithClass:(Class)clsName data:(id)response {
    id instance = [[clsName alloc] init];
    NSDictionary *pathDic = [instance getJsonPathDic];
    
    Class type = [response classForCoder];
    if(type == [NSMutableArray class]) {
        for(int i = 0;i < ((NSMutableArray *)response).count;i++) {
            [self assignDataFromDataWithClass:clsName data:response[i]];
        }
    }else if(type == [NSMutableDictionary class]) {
        for (NSString *key in pathDic) {
            if([[response allKeys] containsObject:pathDic[key]]) {
                [instance setValue:response[pathDic[key]] forKey:key];
            }
        }
        if([clsName isEqual:[PHPageItem class]]) {
            [self.followerInfo addObject:instance];
        }else if([clsName isEqual:[PHFollowingItem class]]) {
            [self.followingInfo addObject:instance];
        }else {
            [self.repoInfo addObject:instance];
        }
    }else {
        NSLog(@"未解析内容-%@",response);
    }
}

-(NSMutableArray *)repoInfo {
    if(!_repoInfo) {
        _repoInfo = [[NSMutableArray alloc] init];
    }
    return _repoInfo;
}

-(NSMutableArray *)followerInfo {
    if(!_followerInfo) {
        _followerInfo = [[NSMutableArray alloc] init];
    }
    return _followerInfo;
}

-(NSMutableArray *)followingInfo {
    if(!_followingInfo) {
        _followingInfo = [[NSMutableArray alloc] init];
    }
    return _followingInfo;
}

@end
