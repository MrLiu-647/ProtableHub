//
//  DTTableViewCell.h
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTTableViewCell : UITableViewCell

-(void)setObject:(id)object;

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object;

+(CGFloat)tableView:(UITableView *)tableView headerHeightForSection:(NSInteger)section;

+(CGFloat)tableView:(UITableView *)tableView footerHeightForSection:(NSInteger)section;

@end

