//
//  PHSearchViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHSearchViewController.h"
#import "PHSearchDataSource.h"

#define StatusBarHeight 44+UIApplication.sharedApplication.statusBarFrame.size.height

@interface PHSearchViewController ()

@end

@implementation PHSearchViewController

- (void)viewDidLoad {
    self.tableViewFrame = CGRectMake(0, StatusBarHeight+50, self.view.frame.size.width, self.navigationController.tabBarController.tabBar.frame.origin.y-(StatusBarHeight+50));
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(id)createDataSource {
    return [[PHSearchDataSource alloc] init];
}

@end
