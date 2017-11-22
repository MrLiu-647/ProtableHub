//
//  PHPersonalDataSource.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalDataSource.h"
#import "PHPersonalTableViewCell.h"
#import "PHPersonalItem.h"

@implementation PHPersonalDataSource

-(instancetype)init {
    self = [super init];
    if(self) {
        DTSectionObject *firstSection = [[DTSectionObject alloc] initWithItemArray:[[NSMutableArray alloc] initWithObjects:[[PHPersonalItem alloc] initWithMainInfo:nil userName:@"yuqingyuan" signature:@"Hello World" star:@"10"],nil]];
        DTSectionObject *secondSection = [[DTSectionObject alloc] initWithItemArray:[[NSMutableArray alloc] initWithObjects:[[PHPersonalItem alloc] initWithFame:@"0" followers:@"0" following:@"0"],nil]];
        self.sections = [NSMutableArray arrayWithObject:firstSection];
        [self.sections addObject:secondSection];
    }
    return self;
}

-(Class)getCurrentCellClass:(NSInteger)section {
    switch (section) {
        case 0:
            return [PHPersonalTableViewCell class];
            break;
        case 1:
            return [PHPersonalFameCell class];
            break;
        default:
            return nil;
            break;
    }
}

@end

