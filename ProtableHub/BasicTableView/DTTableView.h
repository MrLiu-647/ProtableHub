//
//  DTTableView.h
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTTableViewDataSource.h"

@protocol DTTableViewDelegate<UITableViewDelegate>

@optional
//点击Cell返回Cell中的元素
-(void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

//下拉刷新
-(void)pullDownToRefresh:(UIRefreshControl *)refreshControl;

@end

@interface DTTableView : UITableView <UITableViewDelegate>

@property (nonatomic,weak) id<DTTableViewDelegate> dtDelegate;

@property (nonatomic,assign) BOOL isNeedToHavePullDownAction;
@property (nonatomic,assign) BOOL isNeedToHavePullUpAction;
@property (atomic,assign) BOOL isRefreshing;

@property (nonatomic,strong) UIRefreshControl *refreshAction;

@end

