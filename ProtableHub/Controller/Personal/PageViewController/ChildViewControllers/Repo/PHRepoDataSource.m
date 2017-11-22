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

-(Class)getCurrentCellClass:(NSInteger)section {
    return [PHRepoTableViewCell class];
}

@end
