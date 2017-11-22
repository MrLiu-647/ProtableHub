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

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHFollowingTableViewCell class];
}

@end
