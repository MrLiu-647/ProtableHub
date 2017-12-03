//
//  PHPersonalModel.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/28.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseModel.h"
#import "PHPersonalItem.h"

@interface PHPersonalModel : DTBaseModel

@property (nonatomic,copy) NSString *accessToken;   //向服务请求得到的Access Token

@property (nonatomic,strong) PHPersonalItem *basicInfo;
@property (nonatomic,strong) PHPersonalDetailItem *detailInfo;

+(PHPersonalModel *)sharedInstance;

@end
