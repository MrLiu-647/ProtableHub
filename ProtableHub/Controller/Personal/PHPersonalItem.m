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
        self.stars = @"*";
    }
    return self;
}

-(instancetype)initWithMainInfo:(NSData *)avatars userName:(NSString *)name signature:(NSString *)signature star:(NSString *)stars {
    self = [super init];
    if(self) {
        self.userAvatars = avatars;
        self.userName = name;
        self.signature = signature;
        self.stars = stars;
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
