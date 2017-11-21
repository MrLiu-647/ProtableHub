//
//  DTNavigationTableViewController.h
//  DTTableView
//
//  Created by 俞清源 on 2017/11/17.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTRefreshTableViewController.h"

@protocol DTNavigationDelegate

@optional
//在UINavigationBar上添加组件
-(void)constructNavigationBar:(NSString *)titleName;

@end

@interface DTNavigationTableViewController : DTRefreshTableViewController<DTNavigationDelegate>

@property (nonatomic,strong) UIView *fakeNavigationBar;
@property (nonatomic,assign) CGFloat heightForNavigationBar;
@property (nonatomic,assign) UIColor *dtBarColor;

@property (nonatomic,strong) UILabel *navigationTitle;

@end
