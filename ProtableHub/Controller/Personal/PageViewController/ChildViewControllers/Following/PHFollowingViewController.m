//
//  PHFollowingViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowingViewController.h"
#import "PHFollowingDataSource.h"
#import "PHPageModel.h"

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
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(refresh) name:@"refresh" object:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    if(PHPageModel.sharedInstance.followingInfo.count == 0) {
        [self imitatedRefresh];
    }
}

-(id)createDataSource {
    _followingDataSource = [[PHFollowingDataSource alloc] init];
    return _followingDataSource;
}

-(void)refresh {
    [self.tableView reloadData];
}

-(void)pullDownToRefresh:(UIRefreshControl *)refreshControl {
    NSLog(@"子类处理刷新事件");
    if(PHPersonalModel.sharedInstance.detailInfo.following_url) {
        __weak typeof(self) weakSelf = self;
        [PHPageModel.sharedInstance getDataWithApi:PHPersonalModel.sharedInstance.detailInfo.following_url
                                         dataClass:[PHFollowingItem class]
                                           handler:^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.refreshControl endRefreshing];
        }];
    }else {
        [self.tableView.refreshControl endRefreshing];
    }
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
