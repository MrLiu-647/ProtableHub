//
//  PHSearchResultItem.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/16.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHSearchResultItem.h"

@implementation PHSearchResultItem

-(instancetype)init {
    self = [super init];
    if(self) {
        self.searchRepoBio = @"*";
        self.searchRepoName = @"*";
        self.searchUserBio = @"*";
        self.searchUserName = @"*";
        self.isRepoStarred = false;
        self.isUserFollowed = false;
        [self addMappingRuleProperty:@"searchRepoBio" pathInJson:@"description"];
        [self addMappingRuleProperty:@"searchRepoName" pathInJson:@"full_name"];
        [self addMappingRuleProperty:@"searchUserBio" pathInJson:@""];
        [self addMappingRuleProperty:@"searchUserName" pathInJson:@"login"];
    }
    return self;
}

@end
