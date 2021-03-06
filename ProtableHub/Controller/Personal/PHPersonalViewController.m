//
//  PHPersonalViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalViewController.h"
#import "PHPersonalDataSource.h"
#import "PHDataPageViewController.h"
#import "DTAlertController.h"
#import "PHPersonalModel.h"
#import "PHWebViewController.h"
#import <Masonry.h>

#define ClientID @"17bac256e23969714fa5"
#define ClientSecret @"c9fb603ada3b3d51f90dd110bc81b96fd673e31c"

@interface PHPersonalViewController ()

@property (nonatomic,strong) PHPersonalDataSource *phDataSource;

@property (nonatomic,strong) PHDataPageViewController *pageVC;
@property (nonatomic,strong) UIView *childPageView;

@property (nonatomic,strong) UIBarButtonItem *loginItem;
@property (nonatomic,strong) UIBarButtonItem *exitItem;
@property (nonatomic,strong) UIBarButtonItem *refreshItem;

@end

@implementation PHPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setScrollEnabled:false];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    [self.tableView layoutIfNeeded];
    CGFloat contentHeight = self.tableView.contentSize.height;
    
    self.navigationController.navigationBar.topItem.leftBarButtonItem = self.refreshItem;

    if(![NSUserDefaults.standardUserDefaults valueForKey:@"accessToken"]) {
        self.navigationController.navigationBar.topItem.rightBarButtonItem = self.loginItem;
        [self.refreshItem setEnabled:false];
    }else {
        self.navigationController.navigationBar.topItem.rightBarButtonItem = self.exitItem;
    }
    
    //添加子视图
    self.childPageView = self.pageVC.view;
    CGFloat realHeight = self.view.bounds.size.height - contentHeight - self.tabBarController.tabBar.bounds.size.height - 44 - UIApplication.sharedApplication.statusBarFrame.size.height;
    [self.view addSubview:self.childPageView];
    
    __weak typeof(self) weakSelf = self;
    [self.childPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.top.mas_equalTo(contentHeight + 44 + UIApplication.sharedApplication.statusBarFrame.size.height);
        make.width.mas_equalTo(weakSelf.tableView.mas_width);
        make.height.mas_equalTo(realHeight);
    }];
}

-(void)refreshRequest {
    [self.refreshItem setEnabled:false];
    __weak typeof(self) weakSelf = self;
    [PHPersonalModel.sharedInstance refreshRequest:^{
        [weakSelf.tableView reloadData];
        [weakSelf.pageVC refreshCurrentPage];
        [weakSelf.refreshItem setEnabled:true];
    }];
}

-(void)loginRequest {
    [DTAlertController.sharedInstance showAlertWithController:self title:@"登录" message:nil style:UIAlertControllerStyleActionSheet management:@{@"确定":^{
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(getAccesstokenThroughCode:) name:@"code" object:nil];
        PHWebViewController *vc = [[PHWebViewController alloc] init];
        [vc loadWithRequestUrl:@"https://github.com/login/oauth/authorize" params:@{@"client_id":ClientID}];
        [self presentViewController:vc animated:true completion:nil];
    }}];
}

-(void)exitRequest {
    [DTAlertController.sharedInstance showAlertWithController:self title:@"退出" message:nil style:UIAlertControllerStyleActionSheet management:@{@"确定":^{
        [NSUserDefaults.standardUserDefaults removeObjectForKey:@"accessToken"];
        self.navigationController.navigationBar.topItem.rightBarButtonItem = self.loginItem;
        [self.refreshItem setEnabled:false];
        [self.pageVC clearPageData];
        [PHPersonalModel.sharedInstance clearModel];
        [self.tableView reloadData];
    }}];
}

-(id)createDataSource {
    _phDataSource = [[PHPersonalDataSource alloc] init];
    return _phDataSource;
}

-(void)getAccesstokenThroughCode:(NSNotification *)notification {
    PHPersonalModel.sharedInstance.serverAPI.server = @"https://github.com";
    __weak typeof(self) weakSelf = self;
    [PHPersonalModel.sharedInstance lanuchRequestWithParams:@{@"client_id":ClientID,
                                                              @"client_secret":ClientSecret,
                                                              @"code":[notification userInfo][@"code"]}
                                              requestMethod:PH_REQUEST_POST
                                                      route:@"login/oauth/access_token" handler:^{
                                                          [weakSelf.tableView reloadData];
                                                          [weakSelf.refreshItem setEnabled:true];
                                                          [weakSelf.pageVC refreshCurrentPage];
                                                    weakSelf.navigationController.navigationBar.topItem.rightBarButtonItem = weakSelf.exitItem;
                                                      }];
}

//浏览个人详细信息
-(void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        NSLog(@"%@",((PHPersonalItem *)object).user_url);
    }
}

-(PHDataPageViewController *)pageVC {
    if(!_pageVC) {
        _pageVC = [[PHDataPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    }
    return _pageVC;
}

-(UIBarButtonItem *)refreshItem {
    if(!_refreshItem) {
        UIImage *refreshImage = [UIImage imageNamed:@"fa-refresh"];
        _refreshItem = [[UIBarButtonItem alloc] initWithImage:refreshImage style:UIBarButtonItemStylePlain target:self action:@selector(refreshRequest)];
        _refreshItem.image = [refreshImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _refreshItem;
}

-(UIBarButtonItem *)loginItem {
    if(!_loginItem) {
        UIImage *loginView = [UIImage imageNamed:@"login"];
        _loginItem = [[UIBarButtonItem alloc] initWithImage:loginView style:UIBarButtonItemStylePlain target:self action:@selector(loginRequest)];
        _loginItem.image = [loginView imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _loginItem;
}

-(UIBarButtonItem *)exitItem {
    if(!_exitItem) {
        UIImage *exitView = [UIImage imageNamed:@"exit"];
        _exitItem = [[UIBarButtonItem alloc] initWithImage:exitView style:UIBarButtonItemStylePlain target:self action:@selector(exitRequest)];
        _exitItem.image = [exitView imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _exitItem;
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
