//
//  PHSearchResultItem.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/16.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseItem.h"

@interface PHSearchResultItem : DTBaseItem

//repo
@property (nonatomic,copy) NSString *searchRepoName;
@property (nonatomic,copy) NSString *searchRepoBio;
@property (nonatomic,assign) BOOL isRepoStarred;

//user
@property (nonatomic,copy) NSString *searchUserName;
@property (nonatomic,copy) NSString *searchUserBio;
@property (nonatomic,assign) BOOL isUserFollowed;

@end
