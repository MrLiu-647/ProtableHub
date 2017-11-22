//
//  PHDataPageViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHDataPageViewController.h"
#import "PHPageViewDataSource.h"

@interface PHDataPageViewController ()

@property (nonatomic,strong) PHPageViewDataSource *pageDataSource;

@end

@implementation PHDataPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageDataSource = [[PHPageViewDataSource alloc] init];
    self.dataSource = self.pageDataSource;
    
    //设置初始Page页面
    id middleVC = [[self.pageDataSource.containedPages[1] alloc] init];
    [self setViewControllers:@[middleVC] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
}

@end
