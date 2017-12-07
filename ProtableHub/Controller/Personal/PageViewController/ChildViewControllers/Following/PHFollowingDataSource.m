//
//  PHFollowingDataSource.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowingDataSource.h"
#import "PHFollowingTableViewCell.h"
#import "PHPageItem.h"
#import "PHPageModel.h"

@implementation PHFollowingDataSource

-(instancetype)init {
    self = [super init];
    if(self) {
        DTSectionObject *firstSection = [[DTSectionObject alloc] initWithItemArray:nil];
        firstSection.items = PHPageModel.sharedInstance.followingInfo;
        firstSection.headTitle = @"Following";
        self.sections = [NSMutableArray arrayWithObject:firstSection];
    }
    return self;
}

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHFollowingTableViewCell class];
}

@end
