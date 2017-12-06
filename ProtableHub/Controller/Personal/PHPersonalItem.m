//
//  DTPersonalItem.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalItem.h"

@implementation PHPersonalItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.userAvatars = nil;
        self.userName = @"*";
        self.signature = @"*";
        self.createdDate = @"*";
        [self addMappingRuleProperty:@"userName" pathInJson:@"name"];
        [self addMappingRuleProperty:@"signature" pathInJson:@"bio"];
        [self addMappingRuleProperty:@"createdDate" pathInJson:@"created_at"];
        [self addMappingRuleProperty:@"userAvatars" pathInJson:@"avatar_url"];
        [self loadStorageFromLocal];
    }
    return self;
}

-(instancetype)initWithMainInfo:(NSString *)avatars userName:(NSString *)name signature:(NSString *)signature star:(NSString *)stars {
    self = [super init];
    if(self) {
        self.userAvatars = avatars;
        self.userName = name;
        self.signature = signature;
        self.createdDate = stars;
    }
    return self;
}

@end

@implementation PHPersonalDetailItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.repositories = @"*";
        self.followers = @"*";
        self.following = @"*";
        [self addMappingRuleProperty:@"repositories" pathInJson:@"public_repos"];
        [self addMappingRuleProperty:@"followers" pathInJson:@"followers"];
        [self addMappingRuleProperty:@"following" pathInJson:@"following"];
        [self addMappingRuleProperty:@"repos_url" pathInJson:@"repos_url"];
        [self addMappingRuleProperty:@"followers_url" pathInJson:@"followers_url"];
        [self addMappingRuleProperty:@"following_url" pathInJson:@"following_url"];
        [self loadStorageFromLocal];
    }
    return self;
}

-(instancetype)initWithFame:(NSString *)repositories followers:(NSString *)followers following:(NSString *)following {
    self = [super init];
    if(self) {
        self.repositories = repositories;
        self.followers = followers;
        self.following = following;
    }
    return self;
}

@end
