//
//  PHServerAPI.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/25.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef enum {
    PH_STATE_SUCCESS,
    PH_STATE_FAILED,
    PH_STATE_CREATED,
    PH_STATE_LOADING,
    PH_STATE_CANCELLED
}PHProcessState;

typedef enum {
    PH_REQUEST_GET,
    PH_REQUEST_POST
}PHRequestMethod;

@class DTBaseServerAPI;
typedef void(^PHServerCompletionBlock)(DTBaseServerAPI *);

@interface DTBaseServerAPI : NSObject

@property (nonatomic,copy) NSString *server;    // 服务器路径配置
@property (nonatomic,copy) NSString *api;   // 请求路径配置
@property (nonatomic,assign) PHRequestMethod method;    //请求方法

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic,copy) NSDictionary *requestParams; //请求参数
@property (nonatomic,copy) NSDictionary *files; //请求文件
@property (nonatomic,copy) PHServerCompletionBlock userBlock;   //回调的block

@property (nonatomic,retain) NSError *errors;   //错误类型
@property (nonatomic,retain) id jsonData;    //解析过后的json数据
@property (nonatomic,retain) NSData *rawData;   //未解析的二进制数据

@property (nonatomic,assign) PHProcessState state;  //请求状态

-(instancetype)initWithServer:(NSString *)server;

/**
 访问API

 @param api 访问指定服务器的资源地址
 @param params 请求参数
 @param files 请求文件
 @param method 请求方法
 @param block 回调block
 */
-(void)requestAPI:(NSString *)api
           params:(NSDictionary *)params
            files:(NSDictionary *)files
    requestMethod:(PHRequestMethod)method
  completionBlock:(PHServerCompletionBlock)block;

/**
 访问API 默认POST方法

 @param api 访问指定服务器的资源地址
 @param params 请求参数
 @param files 请求文件
 @param block 回调block
 */
-(void)requestAPI:(NSString *)api
           params:(NSDictionary *)params
            files:(NSDictionary *)files
  completionBlock:(PHServerCompletionBlock)block;

/**
 访问API 默认POST方法(无请求文件)
 
 @param api 访问指定服务器的资源地址
 @param params 请求参数
 @param block 回调block
 */
-(void)requestAPI:(NSString *)api
           params:(NSDictionary *)params
  completionBlock:(PHServerCompletionBlock)block;

-(void)cancelRequest;
-(void)refreshRequest;

@end

