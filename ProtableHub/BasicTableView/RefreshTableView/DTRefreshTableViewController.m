//
//  DTRefreshTableViewController.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/14.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTRefreshTableViewController.h"

@interface DTRefreshTableViewController ()

@end

@implementation DTRefreshTableViewController

- (void)viewDidLoad {
    self.tableView.isNeedToHavePullDownAction = true;
    self.tableView.isNeedToHavePullUpAction = true;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//交给网络模块去处理
-(void)pullUpToRefresh:(FetchSuccess)successHandler fail:(FetchFailed)failedHandler {
    
}

@end
