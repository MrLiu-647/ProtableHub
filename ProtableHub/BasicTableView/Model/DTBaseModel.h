//
//  PHBaseModel.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/25.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTBaseServerAPI.h"

typedef void(^SuccessHandler)(void);

@interface DTBaseModel : NSObject

@property (nonatomic,strong) DTBaseServerAPI *serverAPI;

@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *api;

@property (nonatomic,assign) PHRequestMethod method;
@property (nonatomic,copy) NSDictionary *params;

@property (nonatomic,copy) SuccessHandler successBlock;

-(instancetype)initWithServerAddress:(NSString *)address;

-(void)lanuchRequestWithParams:(NSDictionary *)params requestMethod:(PHRequestMethod)method route:(NSString *)api handler:(SuccessHandler)handler;

@end

