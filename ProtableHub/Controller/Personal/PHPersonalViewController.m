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

#define HeightForNavigationBar UIScreen.mainScreen.bounds.size.height/11

@interface PHPersonalViewController ()

@property (nonatomic,strong) PHPersonalDataSource *phDataSource;

@property (nonatomic,strong) PHDataPageViewController *pageVC;
@property (nonatomic,strong) UIView *childPageView;

@end

@implementation PHPersonalViewController

- (void)viewDidLoad {
    self.heightForNavigationBar = HeightForNavigationBar;
    self.dtBarColor = UIColor.whiteColor;
    self.navigationTitle.text = @"Profile";
    self.tableViewFrame = CGRectMake(0, HeightForNavigationBar, self.view.bounds.size.width, 161);
    [super viewDidLoad];
    [self.tableView setScrollEnabled:false];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColor.lightGrayColor;
    
    //添加子视图
    self.childPageView = self.pageVC.view;
    CGFloat realHeight = self.view.bounds.size.height - 160 - 34 - self.tabBarController.tabBar.bounds.size.height - HeightForNavigationBar + 1;
    if(UIScreen.mainScreen.bounds.size.height != 812.0) {
        realHeight += 34;
    }
    self.childPageView.frame = CGRectMake(0, HeightForNavigationBar+160, self.view.bounds.size.width,realHeight);
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

@end
