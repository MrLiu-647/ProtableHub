//
//  DTBasicItem.h
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DTBasicItem : NSObject

@property (nonatomic,assign) CGFloat cellHeight;

//每一条row中最基本的信息
@property (nonatomic, retain) NSString *itemIdentifier;
@property (nonatomic, retain) UIImage *itemImage;
@property (nonatomic, retain) NSString *itemTitle;
@property (nonatomic, retain) NSString *itemSubtitle;
@property (nonatomic, retain) UIImage *itemAccessoryImage;

-(instancetype)initWithImage:(UIImage *)image Title:(NSString *)title SubTitle:(NSString *)subTitle AccessoryImage:(UIImage *)accessoryImage;

@end
