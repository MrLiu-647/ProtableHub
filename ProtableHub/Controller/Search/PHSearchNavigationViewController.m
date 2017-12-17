//
//  PHSearchNavigationViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHSearchNavigationViewController.h"
#import "PHSearchViewController.h"
#import "PHSearchContentManager.h"
#import "PHSearchAccessoryView.h"

#define StatusBarHeight 44+UIApplication.sharedApplication.statusBarFrame.size.height

@interface PHSearchNavigationViewController ()

@property (nonatomic,strong) PHSearchViewController *searchController;
@property (nonatomic,strong) PHSearchContentManager *contentManager;

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) PHSearchAccessoryView *accessoryView;

@end

@implementation PHSearchNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.viewControllers = @[self.searchController];
    [self.searchView addSubview:self.searchBar];
    [self.view addSubview:self.accessoryView];
    self.accessoryView.delegate = self.contentManager;
    self.navigationBar.topItem.titleView = self.searchView;
}

-(PHSearchViewController *)searchController {
    if(!_searchController) {
        _searchController = [[PHSearchViewController alloc] init];
    }
    return _searchController;
}

-(PHSearchContentManager *)contentManager {
    if(!_contentManager) {
        _contentManager = [[PHSearchContentManager alloc] init];
    }
    return _contentManager;
}

-(UISearchBar *)searchBar {
    if(!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 3, self.view.bounds.size.width - 15, 34)];
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.delegate = self.contentManager;
    }
    return _searchBar;
}

-(UIView *)searchView {
    if(!_searchView) {
        _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    }
    return _searchView;
}

-(PHSearchAccessoryView *)accessoryView {
    if(!_accessoryView) {
        _accessoryView = [[PHSearchAccessoryView alloc] initWithFrame:CGRectMake(0, StatusBarHeight, 375, 50)];
        [_accessoryView addSegmentControlWithFrame:CGRectMake(_accessoryView.center.x-100, 10, 200, 30) titles:@[@"Repositories",@"Users"]];
//        [_accessoryView addSortTypeBtnWithFrame:CGRectMake(_accessoryView.center.x+100+50, 10, 22, 32)];
    }
    return _accessoryView;
}

@end
