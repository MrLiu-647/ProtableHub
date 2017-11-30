//
//  DTPersonalItem.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseItem.h"

//个人信息
@interface PHPersonalItem : DTBaseItem

@property (nonatomic,strong) NSData *userAvatars;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *signature;
@property (nonatomic,copy) NSString *stars;

@property (nonatomic,copy) NSString *userCompany;
@property (nonatomic,copy) NSString *userMail;
@property (nonatomic,copy) NSString *userLocation;

@property (nonatomic,copy) NSString *followers;
@property (nonatomic,copy) NSString *following;
@property (nonatomic,copy) NSString *repositories;

-(instancetype)initWithMainInfo:(NSData *)avatars
                       userName:(NSString *)name
                      signature:(NSString *)signature
                           star:(NSString *)stars;

-(instancetype)initWithFame:(NSString *)repositories
                  followers:(NSString *)followers
                  following:(NSString *)following;

@end
