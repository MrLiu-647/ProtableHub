//
//  DTBasicItem.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBasicItem.h"

CGFloat const CellInvalidHeight = -1;

@implementation DTBasicItem

- (instancetype)init {
    self = [self initWithImage:nil Title:nil SubTitle:nil AccessoryImage:nil];
    return self;
}

-(instancetype)initWithImage:(UIImage *)image Title:(NSString *)title SubTitle:(NSString *)subTitle AccessoryImage:(UIImage *)accessoryImage {
    self = [super init];
    if(self) {
        _cellHeight = CellInvalidHeight;
        _itemImage = image;
        _itemTitle = title;
        _itemSubtitle = subTitle;
        _itemAccessoryImage = accessoryImage;
    }
    return self;
}

@end
