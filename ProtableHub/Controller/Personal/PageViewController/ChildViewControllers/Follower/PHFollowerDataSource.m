//
//  PHFollowerDataSource.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowerDataSource.h"
#import "PHFollowerTableViewCell.h"
#import "PHPageItem.h"

@implementation PHFollowerDataSource

-(instancetype)init {
    self = [super init];
    if(self) {
        DTSectionObject *firstSection = [[DTSectionObject alloc] initWithItemArray:[[NSMutableArray alloc] initWithObjects:[[PHPageItem alloc] initWithFollowerIcon:nil followerName:@"yuqingyuan" followerIntro:@"学生"], nil]];
        self.sections = [NSMutableArray arrayWithObject:firstSection];
    }
    return self;
}

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHFollowerTableViewCell class];
}

@end
