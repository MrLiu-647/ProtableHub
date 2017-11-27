//
//  DTTableViewDataSource.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableViewDataSource.h"
#import "DTBasicItem.h"
#import "DTTableViewCell.h"

#import <objc/runtime.h>

@implementation DTTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = ((DTSectionObject *)self.sections[section]).items.count;
    return count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    Class cellClass = [self getCurrentCellClass:section];
    NSString *className = [NSString stringWithUTF8String:class_getName(cellClass)];
    
    id cellInstance = [tableView dequeueReusableCellWithIdentifier:className];
    if(!cellInstance) {
        cellInstance = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
    }
    [cellInstance setObject:((DTSectionObject *)_sections[section]).items[row]];
    return cellInstance;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

-(Class)getCurrentCellClass:(NSInteger)section {
    return [DTTableViewCell class];
}

-(id)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    return ((DTSectionObject *)_sections[section]).items[row];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return ((DTSectionObject *)_sections[section]).headTitle;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if(section == self.sections.count - 1) {
        return ((DTSectionObject *)_sections[section]).footTitle;
    }
    return nil;
}

@end
