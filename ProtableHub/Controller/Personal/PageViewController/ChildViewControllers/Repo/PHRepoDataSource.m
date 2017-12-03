//
//  PHRepoDataSource.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHRepoDataSource.h"
#import "PHRepoTableViewCell.h"
#import "PHPageItem.h"

@implementation PHRepoDataSource

-(instancetype)init {
    self = [super init];
    if(self) {
        DTSectionObject *firstSection = [[DTSectionObject alloc] initWithItemArray:[[NSMutableArray alloc] initWithObjects:[[PHPageItem alloc] initWithRepoName:@"ProtableHub" repoIntro:@"掌上Github" repoMainLanguage:@"Objective-C" repoDetails:nil], nil]];
        firstSection.headTitle = @"Repositories";
        self.sections = [NSMutableArray arrayWithObject:firstSection];
    }
    return self;
}

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHRepoTableViewCell class];
}

@end
