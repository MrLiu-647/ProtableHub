//
//  PHFollowingViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowingViewController.h"
#import "PHFollowingDataSource.h"

@interface PHFollowingViewController ()

@property (nonatomic,strong) PHFollowingDataSource *followingDataSource;

@end

@implementation PHFollowingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self.followingDataSource;
    self.view.backgroundColor = UIColor.blackColor;
    self.tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(id)createDataSource {
    _followingDataSource = [[PHFollowingDataSource alloc] init];
    return _followingDataSource;
}

-(void)pullDownToRefresh {
    NSLog(@"下拉刷新");
}

@end
