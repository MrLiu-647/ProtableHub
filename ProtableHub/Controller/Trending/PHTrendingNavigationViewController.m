//
//  PHTrendingNavigationViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/20.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHTrendingNavigationViewController.h"
#import "PHTrendingTableViewController.h"

@interface PHTrendingNavigationViewController ()

@property (nonatomic,strong) PHTrendingTableViewController *trendingVC;

@end

@implementation PHTrendingNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.trendingVC];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationBar.topItem.title = @"Trending";
}

-(PHTrendingTableViewController *)trendingVC {
    if(!_trendingVC) {
        _trendingVC = [[PHTrendingTableViewController alloc] init];
    }
    return _trendingVC;
}

@end
