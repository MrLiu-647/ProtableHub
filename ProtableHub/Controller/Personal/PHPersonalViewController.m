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
    
    //添加子视图
    self.childPageView = self.pageVC.view;
    CGFloat realHeight = self.view.bounds.size.height - 160 - self.tabBarController.tabBar.bounds.size.height + 1 - 44 - UIApplication.sharedApplication.statusBarFrame.size.height;
    self.childPageView.frame = CGRectMake(0, 44 + UIApplication.sharedApplication.statusBarFrame.size.height + 160, self.view.bounds.size.width,realHeight);
    [self.view addSubview:self.childPageView];
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

-(void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0&&indexPath.row == 0) {
        [DTAlertController.sharedInstance showAlertWithController:self title:@"登录" message:nil style:UIAlertControllerStyleActionSheet management:@{@"确定":^{
            [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(getAccesstokenThroughCode:) name:@"code" object:nil];
            PHWebViewController *vc = [[PHWebViewController alloc] init];
            [vc loadWithRequestUrl:@"https://github.com/login/oauth/authorize" params:@{@"client_id":ClientID}];
            [self presentViewController:vc animated:true completion:nil];
        }}];
    }
}

-(void)getAccesstokenThroughCode:(NSNotification *)notification {
    [PHPersonalModel.sharedInstance lanuchRequestWithParams:@{@"client_id":ClientID,
                                                              @"client_secret":ClientSecret,
                                                              @"code":[notification userInfo][@"code"]}
                                              requestMethod:PH_REQUEST_POST
                                                      route:@"login/oauth/access_token"];
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
