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
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(refresh) name:@"refresh" object:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    if(PHPageModel.sharedInstance.repoInfo.count == 0) {
        [self imitatedRefresh];
    }
}

-(id)createDataSource {
    _repoDataSource = [[PHRepoDataSource alloc] init];
    return _repoDataSource;
}

-(void)refresh {
    [self.tableView reloadData];
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

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
