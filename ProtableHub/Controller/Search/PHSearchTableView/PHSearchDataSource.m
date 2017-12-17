//
//  PHSearchDataSource.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/16.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHSearchDataSource.h"
#import "PHSearchTableViewCell.h"

@implementation PHSearchDataSource

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHSearchTableViewCell class];
}

@end
