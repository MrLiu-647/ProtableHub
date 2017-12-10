//
//  PHPageItem.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseItem.h"

@interface PHPageItem : DTBaseItem

//followers
@property (nonatomic,copy) NSString *followerIcon;
@property (nonatomic,copy) NSString *followerName;
@property (nonatomic,copy) NSString *followerIntro;

-(instancetype)initWithFollowerIcon:(NSString *)data followerName:(NSString *)name followerIntro:(NSString *)intro;

@end

@interface PHRepoItem : DTBaseItem

//repo
@property (nonatomic,copy) NSString *repoName;
@property (nonatomic,copy) NSString *repoIntro;
@property (nonatomic,copy) NSString *repoMainLanguage;
@property (nonatomic,copy) NSString *repoDetails;
@property (nonatomic,copy) NSString *repoAuthor;
@property (nonatomic,copy) NSString *repoType;

@property (nonatomic,copy) NSString *repoStarsCount;    //仓库的star数

-(instancetype)initWithRepoName:(NSString *)name repoIntro:(NSString *)intro repoMainLanguage:(NSString *)language repoDetails:(NSString *)details;

@end

@interface PHFollowingItem : DTBaseItem

//following
@property (nonatomic,copy) NSString *followingIcon;
@property (nonatomic,copy) NSString *followingName;
@property (nonatomic,copy) NSString *followingIntro;

-(instancetype)initWithFollowingIcon:(NSString *)data followingName:(NSString *)name followingIntro:(NSString *)intro;

@end
