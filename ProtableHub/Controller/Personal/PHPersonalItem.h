//
//  DTPersonalItem.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseItem.h"

//个人信息
@interface PHPersonalItem : DTBaseItem <NSCoding>

@property (nonatomic,copy) NSString *userAvatars;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *userSignature;
@property (nonatomic,copy) NSString *userCreatedDate;

@property (nonatomic,copy) NSString *userCompany;
@property (nonatomic,copy) NSString *userMail;
@property (nonatomic,copy) NSString *userLocation;

@property (nonatomic,copy) NSString *user_url;

-(instancetype)initWithMainInfo:(NSString *)avatars
                       userName:(NSString *)name
                      signature:(NSString *)signature
                           star:(NSString *)stars;

@end

@interface PHPersonalDetailItem : DTBaseItem <NSCoding>

@property (nonatomic,copy) NSString *followers;
@property (nonatomic,copy) NSString *following;
@property (nonatomic,copy) NSString *repositories;

@property (nonatomic,copy) NSString *following_url;
@property (nonatomic,copy) NSString *followers_url;
@property (nonatomic,copy) NSString *repos_url;

-(instancetype)initWithFame:(NSString *)repositories
                  followers:(NSString *)followers
                  following:(NSString *)following;

@end
