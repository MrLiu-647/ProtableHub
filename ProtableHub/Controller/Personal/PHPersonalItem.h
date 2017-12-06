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

@property (nonatomic,copy) NSString *userAvatars;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *signature;
@property (nonatomic,copy) NSString *createdDate;

@property (nonatomic,copy) NSString *userCompany;
@property (nonatomic,copy) NSString *userMail;
@property (nonatomic,copy) NSString *userLocation;

-(instancetype)initWithMainInfo:(NSString *)avatars
                       userName:(NSString *)name
                      signature:(NSString *)signature
                           star:(NSString *)stars;

@end

@interface PHPersonalDetailItem : DTBaseItem

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
