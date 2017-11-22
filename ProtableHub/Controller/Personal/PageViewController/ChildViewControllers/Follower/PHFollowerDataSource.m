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

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHFollowerTableViewCell class];
}

@end
