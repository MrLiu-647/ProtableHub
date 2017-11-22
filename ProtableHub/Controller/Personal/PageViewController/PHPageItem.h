//
//  PHPageItem.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBasicItem.h"

@interface PHPageItem : DTBasicItem

//repo
@property (nonatomic,copy) NSString *repoName;
@property (nonatomic,copy) NSString *repoIntro;
@property (nonatomic,copy) NSString *repoMainLanguage;
@property (nonatomic,copy) NSString *repoDetails;
@property (nonatomic,copy) NSString *repoAuthor;

//followers
@property (nonatomic,strong) NSData *followerIcon;
@property (nonatomic,copy) NSString *followerName;
@property (nonatomic,copy) NSString *followerIntro;

//following
@property (nonatomic,strong) NSData *followingIcon;
@property (nonatomic,copy) NSString *followingName;
@property (nonatomic,copy) NSString *followingIntro;

-(instancetype)initWithRepoName:(NSString *)name repoIntro:(NSString *)intro repoMainLanguage:(NSString *)language repoDetails:(NSString *)details;

-(instancetype)initWithFollowerIcon:(NSData *)data followerName:(NSString *)name followerIntro:(NSString *)intro;

-(instancetype)initWithFollowingIcon:(NSData *)data followingName:(NSString *)name followingIntro:(NSString *)intro;

@end

