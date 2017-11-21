//
//  DTSectionObject.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTSectionObject.h"

@implementation DTSectionObject

-(instancetype)init {
    self = [super init];
    if(self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

-(instancetype)initWithItemArray:(NSMutableArray *)items {
    self = [super init];
    _items = [[NSMutableArray alloc] init];
    if(self) {
        [_items addObjectsFromArray:items];
    }
    return self;
}

@end
