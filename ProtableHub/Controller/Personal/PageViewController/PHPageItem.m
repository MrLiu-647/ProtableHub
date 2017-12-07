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
        [self addMappingRuleProperty:@"followingIcon" pathInJson:@"avatar_url"];
        [self addMappingRuleProperty:@"followerName" pathInJson:@"login"];
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

@end

@implementation PHRepoItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.repoName = @"*";
        self.repoIntro = @"*";
        self.repoMainLanguage = @"*";
        [self addMappingRuleProperty:@"repoName" pathInJson:@"name"];
        [self addMappingRuleProperty:@"repoIntro" pathInJson:@"description"];
        [self addMappingRuleProperty:@"repoMainLanguage" pathInJson:@"language"];
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

@end

@implementation PHFollowingItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.followingIcon = nil;
        self.followingName = @"*";
        self.followingIntro = @"*";
        [self addMappingRuleProperty:@"followingIcon" pathInJson:@"avatar_url"];
        [self addMappingRuleProperty:@"followingName" pathInJson:@"login"];
    }
    return self;
}

-(instancetype)initWithFollowingIcon:(NSString *)data followingName:(NSString *)name followingIntro:(NSString *)intro {
    self = [super init];
    if(self) {
        self.followingIcon = data;
        self.followingName = name;
        self.followingIntro = intro;
    }
    return self;
}

@end

