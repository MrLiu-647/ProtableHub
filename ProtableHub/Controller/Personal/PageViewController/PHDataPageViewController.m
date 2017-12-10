//
//  PHDataPageViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHDataPageViewController.h"
#import "PHPageViewDataSource.h"
#import "PHPageModel.h"

@interface PHDataPageViewController ()

@property (nonatomic,strong) PHPageViewDataSource *pageDataSource;

@property (nonatomic,strong) id currentPage;

@end

@implementation PHDataPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageDataSource = [[PHPageViewDataSource alloc] init];
    self.dataSource = self.pageDataSource;
    
    //设置初始Page页面
    self.currentPage = [[self.pageDataSource.containedPages[1] alloc] init];
    [self setViewControllers:@[self.currentPage] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
}

-(void)refreshCurrentPage {
    [self.currentPage imitatedRefresh];
    self.view.userInteractionEnabled = true;
}

-(void)clearPageData {
    [PHPageModel.sharedInstance clearModel];
    [self.currentPage refreshData];
}

@end
