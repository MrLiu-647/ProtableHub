//
//  DTTableViewDataSource.h
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DTSectionObject.h"

@class DTBasicItem;

@protocol DTTableViewDataSourceDelegate

@required
-(Class)getCurrentCellClass:(NSInteger)section;

@optional
-(id)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface DTTableViewDataSource : NSObject <UITableViewDataSource,DTTableViewDataSourceDelegate>

@property (nonatomic,strong) NSMutableArray *sections;  //二维数组,每个元素都是sectionObject对象

@end
