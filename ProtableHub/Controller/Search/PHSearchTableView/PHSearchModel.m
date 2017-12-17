//
//  PHSearchModel.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/16.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHSearchModel.h"

@implementation PHSearchModel

+(PHSearchModel *)sharedInstance {
    static PHSearchModel *model;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!model) {
            model = [[PHSearchModel alloc] initWithServerAddress:@"https://api.github.com/search"];
        }
    });
    return model;
}

-(void)isNeedToHandleData:(DTBaseServerAPI *)response {
    SLog(@"%@",response.jsonData);
}

@end
