//
//  DTSectionObject.h
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTSectionObject : NSObject

@property (nonatomic,strong) NSString *headTitle;
@property (nonatomic,strong) NSString *footTitle;

//一个section的内容,数组元素为Item对象
@property (nonatomic, retain) NSMutableArray *items;

-(instancetype)initWithItemArray:(NSMutableArray *)items;

@end
