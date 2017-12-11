//
//  PHRepoViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHRepoViewController.h"
#import "PHRepoDataSource.h"
#import "PHPageModel.h"

@interface PHRepoViewController ()

@property (nonatomic,strong) PHRepoDataSource *repoDataSource;

@end

@implementation PHRepoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self.repoDataSource;
    self.view.backgroundColor = UIColor.blackColor;
    self.tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
}

-(void)viewWillAppear:(BOOL)animated {
    if(animated) {
        [self.tableView reloadData];
    }
}

-(id)createDataSource {
    _repoDataSource = [[PHRepoDataSource alloc] init];
    return _repoDataSource;
}

-(void)pullDownToRefresh:(UIRefreshControl *)refreshControl {
    NSLog(@"子类处理刷新事件");
    if(PHPersonalModel.sharedInstance.detailInfo.repos_url) {
        __weak typeof(self) weakSelf = self;
        [PHPageModel.sharedInstance getDataWithApi:PHPersonalModel.sharedInstance.detailInfo.repos_url
                                         dataClass:[PHRepoItem class]
                                           handler:^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.refreshControl endRefreshing];
        }];
    }else {
        [self.tableView.refreshControl endRefreshing];
    }
}

@end
