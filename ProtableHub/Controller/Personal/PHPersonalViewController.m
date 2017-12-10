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

@end

@implementation PHPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setScrollEnabled:false];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    [self.tableView layoutIfNeeded];
    CGFloat contentHeight = self.tableView.contentSize.height;
    
    UIImage *selectedView = [UIImage imageNamed:@"login"];
    selectedView = [selectedView imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.topItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:selectedView style:UIBarButtonItemStylePlain target:self action:@selector(loginOrExitRequest)];
    
    //添加子视图
    self.childPageView = self.pageVC.view;
    CGFloat realHeight = self.view.bounds.size.height - contentHeight - self.tabBarController.tabBar.bounds.size.height - 44 - UIApplication.sharedApplication.statusBarFrame.size.height;
    [self.view addSubview:self.childPageView];
    
    __weak typeof(self) weakSelf = self;
    [self.childPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(contentHeight + 44 + UIApplication.sharedApplication.statusBarFrame.size.height);
        make.width.mas_equalTo(weakSelf.tableView.mas_width);
        make.height.mas_equalTo(realHeight);
    }];
}

-(void)loginOrExitRequest {
    [DTAlertController.sharedInstance showAlertWithController:self title:@"登录" message:nil style:UIAlertControllerStyleActionSheet management:@{@"确定":^{
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(getAccesstokenThroughCode:) name:@"code" object:nil];
        PHWebViewController *vc = [[PHWebViewController alloc] init];
        [vc loadWithRequestUrl:@"https://github.com/login/oauth/authorize" params:@{@"client_id":ClientID}];
        [self presentViewController:vc animated:true completion:nil];
    }}];
}

-(id)createDataSource {
    _phDataSource = [[PHPersonalDataSource alloc] init];
    return _phDataSource;
}

-(PHDataPageViewController *)pageVC {
    if(!_pageVC) {
        _pageVC = [[PHDataPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    }
    return _pageVC;
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
                                                          [self.pageVC refreshCurrentPage];
                                                      }];
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
