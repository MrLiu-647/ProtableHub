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
        self.userName = @"xxxxxxx";
        self.signature = @"xxxxxxx";
        self.stars = @"xxxxxxx";
        self.repositories = @"0";
        self.followers = @"0";
        self.following = @"0";
    }
    return self;
}

-(instancetype)initWithMainInfo:(NSData *)avatars userName:(NSString *)name signature:(NSString *)signature star:(NSString *)stars {
    self = [self init];
    if(self) {
        self.userAvatars = avatars;
        self.userName = name;
        self.signature = signature;
        self.stars = stars;
    }
    return self;
}

-(instancetype)initWithFame:(NSString *)repositories followers:(NSString *)followers following:(NSString *)following {
    self = [self initWithMainInfo:self.userAvatars userName:self.userName signature:self.signature star:self.stars];
    if(self) {
        self.repositories = repositories;
        self.followers = followers;
        self.following = following;
    }
    return self;
}

@end

@implementation PHRepositoryItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.repoName = @"xxxxxxx";
        self.repoLanguage = @"xxxxxxx";
        self.briefIntro = @"xxxxxxx";
    }
    return self;
}

-(instancetype)initWithRepoName:(NSString *)name language:(NSString *)language intro:(NSString *)intro {
    self = [self init];
    if(self) {
        self.repoName = name;
        self.repoLanguage = language;
        self.briefIntro = intro;
    }
    return self;
}

@end
