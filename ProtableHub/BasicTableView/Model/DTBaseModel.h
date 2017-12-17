//
//  PHBaseModel.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/25.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTBaseServerAPI.h"

//完整的打印Json信息
#ifdef DEBUG
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define SLog(format, ...)
#endif

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

-(void)refreshRequest:(SuccessHandler)handler;

@end

