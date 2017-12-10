//
//  DTTableView.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableView.h"
#import "DTTableViewCell.h"

@implementation DTTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if(self) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.showsVerticalScrollIndicator = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.sectionHeaderHeight = 0;
        self.sectionFooterHeight = 0;
        self.isNeedToHavePullDownAction = false;
        self.isNeedToHavePullUpAction = false;
        self.isRefreshing = false;
        self.delegate = self;
    }
    return self;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.dtDelegate respondsToSelector:@selector(didSelectObject:atIndexPath:)]) {
        id<DTTableViewDataSourceDelegate> dataSource = (id<DTTableViewDataSourceDelegate>)tableView.dataSource;
        id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
        [self.dtDelegate didSelectObject:object atIndexPath:indexPath];
        [tableView deselectRowAtIndexPath:indexPath animated:true];
    }
    else {
        [tableView deselectRowAtIndexPath:indexPath animated:true];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<DTTableViewDataSourceDelegate> dataSource = (id<DTTableViewDataSourceDelegate>)tableView.dataSource;
    id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
    Class cls = [dataSource getCurrentCellClass:indexPath.section];
    
    NSString *height = [[NSString alloc] initWithFormat:@"%@",[object valueForKey:@"cellHeight"]];
    CGFloat cellHeight = [height floatValue];
    
    if(cellHeight <= 0) {
        cellHeight = [cls tableView:tableView rowHeightForObject:object];
    }
    return cellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id<DTTableViewDataSourceDelegate> dataSource = (id<DTTableViewDataSourceDelegate>)tableView.dataSource;
    Class cls = [dataSource getCurrentCellClass:section];
    NSInteger headerHeight = [cls tableView:tableView headerHeightForSection:section];
    return headerHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    id<DTTableViewDataSourceDelegate> dataSource = (id<DTTableViewDataSourceDelegate>)tableView.dataSource;
    Class cls = [dataSource getCurrentCellClass:section];
    NSInteger headerHeight = [cls tableView:tableView footerHeightForSection:section];
    return headerHeight;
}

-(void)setIsNeedToHavePullDownAction:(BOOL)isNeedToHavePullDownAction {
    if(_isNeedToHavePullDownAction == isNeedToHavePullDownAction) {
        return;
    }
    _isNeedToHavePullDownAction = isNeedToHavePullDownAction;
    if(_isNeedToHavePullDownAction) {
        if([self.dtDelegate respondsToSelector:@selector(pullDownToRefresh:)]) {
            [self createRefreshControl];
        }
    }
}

-(void)createRefreshControl {
    if(!_refreshAction) {
        _refreshAction = [[UIRefreshControl alloc] init];
        [_refreshAction addTarget:self.dtDelegate action:@selector(pullDownToRefresh:) forControlEvents:UIControlEventValueChanged];
        self.refreshControl = _refreshAction;
    }
}

@end

