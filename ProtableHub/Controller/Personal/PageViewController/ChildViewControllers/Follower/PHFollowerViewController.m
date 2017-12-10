//
//  PHFollowerViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowerViewController.h"
#import "PHFollowerDataSource.h"
#import "PHPageModel.h"

@interface PHFollowerViewController ()

@property (nonatomic,strong) PHFollowerDataSource *followerDataSource;

@end

@implementation PHFollowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self.followerDataSource;
    self.view.backgroundColor = UIColor.blackColor;
    self.tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(id)createDataSource {
    _followerDataSource = [[PHFollowerDataSource alloc] init];
    return _followerDataSource;
}

-(void)pullDownToRefresh:(UIRefreshControl *)refreshControl {
    NSLog(@"子类处理刷新事件");
    if([NSUserDefaults.standardUserDefaults valueForKey:@"followers_url"]) {
        __weak typeof(self) weakSelf = self;
        [PHPageModel.sharedInstance getDataWithApi:[NSUserDefaults.standardUserDefaults valueForKey:@"followers_url"] dataClass:[PHPageItem class] handler:^{
            [PHPageModel.sharedInstance getDataWithApi:[NSUserDefaults.standardUserDefaults valueForKey:@"following_url"] dataClass:[PHFollowingItem class] handler:^{
                [PHPageModel.sharedInstance getDataWithApi:[NSUserDefaults.standardUserDefaults valueForKey:@"repos_url"] dataClass:[PHRepoItem class] handler:^{
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView.refreshControl endRefreshing];
                }];
            }];
        }];
    }else {
        [self.tableView.refreshControl endRefreshing];
    }
}

@end
