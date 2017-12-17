//
//  PHTabBarController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHTabBarController.h"
#import "PHPersonalNavigationViewController.h"
#import "PHSearchNavigationViewController.h"

@interface PHTabBarController ()

@property (nonatomic,strong) PHPersonalNavigationViewController *personalVC;
@property (nonatomic,strong) PHSearchNavigationViewController *searchVC;

@end

@implementation PHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.personalVC,self.searchVC];
}

-(PHPersonalNavigationViewController *)personalVC {
    if(!_personalVC) {
        _personalVC = [[PHPersonalNavigationViewController alloc] init];
        _personalVC.tabBarItem.title = @"Profile";
        _personalVC.tabBarItem.image = [UIImage imageNamed:@"personal"];
    }
    return _personalVC;
}

-(PHSearchNavigationViewController *)searchVC {
    if(!_searchVC) {
        _searchVC = [[PHSearchNavigationViewController alloc] init];
        _searchVC.tabBarItem.title = @"Search";
        _searchVC.tabBarItem.image = [UIImage imageNamed:@"fa-search"];
    }
    return _searchVC;
}

@end
