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
        self.repoName = @"xxxxxxx";
        self.repoIntro = @"xxxxxxx";
        self.repoDetails = @"xxxxxxx";
        self.repoMainLanguage = @"xxxxxxx";
        
        self.followerIcon = nil;
        self.followerName = @"xxxxxxx";
        self.followerIntro = @"xxxxxxx";
        
        self.followingIcon = nil;
        self.followingName = @"xxxxxxx";
        self.followingIntro = @"xxxxxxx";
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

-(instancetype)initWithFollowerIcon:(NSData *)data followerName:(NSString *)name followerIntro:(NSString *)intro {
    self = [super init];
    if(self) {
        self.followerIcon = data;
        self.followerName = name;
        self.followerIntro = intro;
    }
    return self;
}

-(instancetype)initWithFollowingIcon:(NSData *)data followingName:(NSString *)name followingIntro:(NSString *)intro {
    self = [super init];
    if(self) {
        self.followingIcon = data;
        self.followingName = name;
        self.followingIntro = intro;
    }
    return self;
}

@end
