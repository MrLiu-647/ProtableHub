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

@implementation PHFollowingDataSource

-(instancetype)init {
    self = [super init];
    if(self) {
        DTSectionObject *firstSection = [[DTSectionObject alloc] initWithItemArray:[[NSMutableArray alloc] initWithObjects:[[PHPageItem alloc] initWithFollowingIcon:nil followingName:@"yuqingyuan" followingIntro:@"iOS小白"], nil]];
        self.sections = [NSMutableArray arrayWithObject:firstSection];
    }
    return self;
}

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHFollowingTableViewCell class];
}

@end
