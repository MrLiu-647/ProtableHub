//
//  PHPageItem.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPageItem.h"

@implementation PHPageItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.followerIcon = nil;
        self.followerName = @"*";
        self.followerIntro = @"*";
        self.followerUrl = @"*";
        self.followerDetailUrl = @"*";
        [self addMappingRuleProperty:@"followerIcon" pathInJson:@"avatar_url"];
        [self addMappingRuleProperty:@"followerName" pathInJson:@"login"];
        [self addMappingRuleProperty:@"followerUrl" pathInJson:@"html_url"];
        [self addMappingRuleProperty:@"followerDetailUrl" pathInJson:@"url"];
    }
    return self;
}

-(instancetype)initWithFollowerIcon:(NSString *)data followerName:(NSString *)name followerIntro:(NSString *)intro {
    self = [super init];
    if(self) {
        self.followerIcon = data;
        self.followerName = name;
        self.followerIntro = intro;
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.followerIcon forKey:@"followerIcon"];
    [aCoder encodeObject:self.followerName forKey:@"followerName"];
    [aCoder encodeObject:self.followerUrl forKey:@"followerUrl"];
    [aCoder encodeObject:self.followerDetailUrl forKey:@"followerDetailUrl"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.followerIcon = [aDecoder decodeObjectForKey:@"followerIcon"];
        self.followerName = [aDecoder decodeObjectForKey:@"followerName"];
        self.followerUrl = [aDecoder decodeObjectForKey:@"followerUrl"];
        self.followerDetailUrl = [aDecoder decodeObjectForKey:@"followerDetailUrl"];
    }
    return self;
}

@end

@implementation PHRepoItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.repoName = @"*";
        self.repoIntro = @"*";
        self.repoMainLanguage = @"*";
        self.repoType = @"0";
        self.repoStarsCount = @"0";
        [self addMappingRuleProperty:@"repoName" pathInJson:@"name"];
        [self addMappingRuleProperty:@"repoIntro" pathInJson:@"description"];
        [self addMappingRuleProperty:@"repoMainLanguage" pathInJson:@"language"];
        [self addMappingRuleProperty:@"repoType" pathInJson:@"fork"];
        [self addMappingRuleProperty:@"repoStarsCount" pathInJson:@"stargazers_count"];
    }
    return self;
}

-(instancetype)initWithRepoName:(NSString *)name repoIntro:(NSString *)intro repoMainLanguage:(NSString *)language repoDetails:(NSString *)details {
    self = [super init];
    if(self) {
        self.repoName = name;
        self.repoIntro = intro;
        self.repoDetails = details;
        self.repoMainLanguage = language;
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.repoName forKey:@"repoName"];
    [aCoder encodeObject:self.repoIntro forKey:@"repoIntro"];
    [aCoder encodeObject:self.repoType forKey:@"repoType"];
    [aCoder encodeObject:self.repoMainLanguage forKey:@"repoMainLanguage"];
    [aCoder encodeObject:self.repoStarsCount forKey:@"repoStarsCount"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.repoName = [aDecoder decodeObjectForKey:@"repoName"];
        self.repoType = [aDecoder decodeObjectForKey:@"repoType"];
        self.repoIntro = [aDecoder decodeObjectForKey:@"repoIntro"];
        self.repoMainLanguage = [aDecoder decodeObjectForKey:@"repoMainLanguage"];
        self.repoStarsCount = [aDecoder decodeObjectForKey:@"repoStarsCount"];
    }
    return self;
}

@end

@implementation PHFollowingItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.followingIcon = nil;
        self.followingName = @"*";
        self.followingIntro = @"*";
        self.followingUrl = @"*";
        self.followingDetailUrl = @"*";
        [self addMappingRuleProperty:@"followingIcon" pathInJson:@"avatar_url"];
        [self addMappingRuleProperty:@"followingName" pathInJson:@"login"];
        [self addMappingRuleProperty:@"followingUrl" pathInJson:@"html_url"];
        [self addMappingRuleProperty:@"followingDetailUrl" pathInJson:@"url"];
    }
    return self;
}

-(instancetype)initWithFollowingIcon:(NSString *)data followingName:(NSString *)name followingIntro:(NSString *)intro {
    self = [super init];
    if(self) {
        self.followingIcon = data;
        self.followingName = name;
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.followingIcon forKey:@"followingIcon"];
    [aCoder encodeObject:self.followingName forKey:@"followingName"];
    [aCoder encodeObject:self.followingUrl forKey:@"followingUrl"];
    [aCoder encodeObject:self.followingDetailUrl forKey:@"followingDetailUrl"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.followingName = [aDecoder decodeObjectForKey:@"followingName"];
        self.followingIcon = [aDecoder decodeObjectForKey:@"followingIcon"];
        self.followingUrl = [aDecoder decodeObjectForKey:@"followingUrl"];
        self.followingDetailUrl = [aDecoder decodeObjectForKey:@"followingDetailUrl"];
    }
    return self;
}

@end

