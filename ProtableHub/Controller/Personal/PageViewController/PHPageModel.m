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
    
    __weak typeof(self) weakSelf = self;
    [self.serverAPI requestAPI:nil
                        params:nil
                         files:nil
                 requestMethod:PH_REQUEST_GET
               completionBlock:^(DTBaseServerAPI *response) {
                   if([className isEqual:[PHPageItem class]]) {
                       [weakSelf.followerInfo removeAllObjects];
                   }else if([className isEqual:[PHFollowingItem class]]) {
                       [weakSelf.followingInfo removeAllObjects];
                   }else {
                       [weakSelf.repoInfo removeAllObjects];
                   }
                   [weakSelf assignDataFromDataWithClass:className data:response.jsonData];
                   weakSelf.phBlock();
                   [self storeIntoLocal];
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
                [instance setValue:[[NSString alloc] initWithFormat:@"%@",response[pathDic[key]]] forKey:key];
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

//清空数据源
-(void)clearModel {
    [self.repoInfo removeAllObjects];
    [self.followingInfo removeAllObjects];
    [self.followerInfo removeAllObjects];
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"repoInfo"];
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"followingInfo"];
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"followerInfo"];
}

//存储到本地缓存
-(void)storeIntoLocal {
    NSMutableArray *storage_1 = [[NSMutableArray alloc] init];
    for(int i = 0;i < self.repoInfo.count;i++) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.repoInfo[i]];
        [storage_1 addObject:data];
    }
    NSArray *array = [NSArray arrayWithArray:storage_1];
    [NSUserDefaults.standardUserDefaults setObject:array forKey:@"repoInfo"];
    
    storage_1 = [[NSMutableArray alloc] init];
    for(int i = 0;i < self.followerInfo.count;i++) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.followerInfo[i]];
        [storage_1 addObject:data];
    }
    array = [NSArray arrayWithArray:storage_1];
    [NSUserDefaults.standardUserDefaults setObject:array forKey:@"followerInfo"];
    
    storage_1 = [[NSMutableArray alloc] init];
    for(int i = 0;i < self.followingInfo.count;i++) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.followingInfo[i]];
        [storage_1 addObject:data];
    }
    array = [NSArray arrayWithArray:storage_1];
    [NSUserDefaults.standardUserDefaults setObject:array forKey:@"followingInfo"];
    
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(NSMutableArray *)repoInfo {
    if(!_repoInfo) {
        _repoInfo = [[NSMutableArray alloc] init];
        if([NSUserDefaults.standardUserDefaults valueForKey:@"repoInfo"]) {
            NSArray *array = [NSUserDefaults.standardUserDefaults valueForKey:@"repoInfo"];
            NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
            for(int i = 0;i < array.count;i++) {
                [mutableArray addObject:[NSKeyedUnarchiver unarchiveObjectWithData:array[i]]];
            }
            _repoInfo = mutableArray;
        }
    }
    return _repoInfo;
}

-(NSMutableArray *)followerInfo {
    if(!_followerInfo) {
        _followerInfo = [[NSMutableArray alloc] init];
        if([NSUserDefaults.standardUserDefaults valueForKey:@"followerInfo"]) {
            NSArray *array = [NSUserDefaults.standardUserDefaults valueForKey:@"followerInfo"];
            NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
            for(int i = 0;i < array.count;i++) {
                [mutableArray addObject:[NSKeyedUnarchiver unarchiveObjectWithData:array[i]]];
            }
            _followerInfo = mutableArray;
        }
    }
    return _followerInfo;
}

-(NSMutableArray *)followingInfo {
    if(!_followingInfo) {
        _followingInfo = [[NSMutableArray alloc] init];
        if([NSUserDefaults.standardUserDefaults valueForKey:@"followingInfo"]) {
            NSArray *array = [NSUserDefaults.standardUserDefaults valueForKey:@"followingInfo"];
            NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
            for(int i = 0;i < array.count;i++) {
                [mutableArray addObject:[NSKeyedUnarchiver unarchiveObjectWithData:array[i]]];
            }
            _followingInfo = mutableArray;
        }
    }
    return _followingInfo;
}

@end
