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
        self.userSignature = @"*";
        self.userCreatedDate = @"*";
        self.user_url = nil;
        [self addMappingRuleProperty:@"userName" pathInJson:@"name"];
        [self addMappingRuleProperty:@"userSignature" pathInJson:@"bio"];
        [self addMappingRuleProperty:@"userCreatedDate" pathInJson:@"created_at"];
        [self addMappingRuleProperty:@"userAvatars" pathInJson:@"avatar_url"];
        [self addMappingRuleProperty:@"user_url" pathInJson:@"url"];
    }
    return self;
}

-(instancetype)initWithMainInfo:(NSString *)avatars userName:(NSString *)name signature:(NSString *)signature star:(NSString *)stars {
    self = [super init];
    if(self) {
        self.userAvatars = avatars;
        self.userName = name;
        self.userSignature = signature;
        self.userCreatedDate = stars;
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.userCreatedDate forKey:@"userCreatedDate"];
    [aCoder encodeObject:self.userSignature forKey:@"userSignature"];
    [aCoder encodeObject:self.userAvatars forKey:@"userAvatars"];
    [aCoder encodeObject:self.jsonDataMap forKey:@"jsonDataMap"];
    [aCoder encodeObject:self.user_url forKey:@"user_url"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userSignature = [aDecoder decodeObjectForKey:@"userSignature"];
        self.userCreatedDate = [aDecoder decodeObjectForKey:@"userCreatedDate"];
        self.userAvatars = [aDecoder decodeObjectForKey:@"userAvatars"];
        self.jsonDataMap = [aDecoder decodeObjectForKey:@"jsonDataMap"];
        self.user_url = [aDecoder decodeObjectForKey:@"user_url"];
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
        self.repos_url = nil;
        self.following_url = nil;
        self.followers_url = nil;
        [self addMappingRuleProperty:@"repositories" pathInJson:@"public_repos"];
        [self addMappingRuleProperty:@"followers" pathInJson:@"followers"];
        [self addMappingRuleProperty:@"following" pathInJson:@"following"];
        [self addMappingRuleProperty:@"repos_url" pathInJson:@"repos_url"];
        [self addMappingRuleProperty:@"followers_url" pathInJson:@"followers_url"];
        [self addMappingRuleProperty:@"following_url" pathInJson:@"following_url"];
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

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.repositories forKey:@"repositories"];
    [aCoder encodeObject:self.followers forKey:@"followers"];
    [aCoder encodeObject:self.following forKey:@"following"];
    [aCoder encodeObject:self.repos_url forKey:@"repos_url"];
    [aCoder encodeObject:self.followers_url forKey:@"followers_url"];
    [aCoder encodeObject:self.following_url forKey:@"following_url"];
    [aCoder encodeObject:self.jsonDataMap forKey:@"jsonDataMap"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.repositories = [aDecoder decodeObjectForKey:@"repositories"];
        self.following = [aDecoder decodeObjectForKey:@"following"];
        self.followers = [aDecoder decodeObjectForKey:@"followers"];
        self.repos_url = [aDecoder decodeObjectForKey:@"repos_url"];
        self.following_url = [aDecoder decodeObjectForKey:@"following_url"];
        self.followers_url = [aDecoder decodeObjectForKey:@"followers_url"];
        self.jsonDataMap = [aDecoder decodeObjectForKey:@"jsonDataMap"];
    }
    return self;
}

@end
