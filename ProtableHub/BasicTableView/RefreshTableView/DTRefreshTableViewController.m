//
//  DTRefreshTableViewController.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/14.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTRefreshTableViewController.h"

@interface DTRefreshTableViewController ()

@property (nonatomic,assign) BOOL isRefreshing;

@end

@implementation DTRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.isNeedToHavePullDownAction = true;
    self.tableView.isNeedToHavePullUpAction = false;
    self.isRefreshing = false;
}

//刷新数据
-(void)pullDownToRefresh:(UIRefreshControl *)refreshControl {
    NSLog(@"刷新请求,Model层处理事件");
}

-(void)imitatedRefresh {
    if(self.isRefreshing) {
        NSLog(@"正在刷新");
    }
    else {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.tableView.contentOffset = CGPointMake(0, -self.tableView.refreshControl.frame.size.height);
        } completion:^(BOOL finished) {
            if(!self.tableView.refreshControl.isRefreshing) {
                [self.tableView.refreshControl beginRefreshing];
            }
            [self pullDownToRefresh:self.tableView.refreshControl];
        }];
    }
}

@end
