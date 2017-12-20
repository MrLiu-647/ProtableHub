//
//  PHNewsNavigationViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/19.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHNewsNavigationViewController.h"
#import "PHNewsTableViewController.h"

@interface PHNewsNavigationViewController ()

@property (nonatomic,strong) PHNewsTableViewController *newsVC;

@end

@implementation PHNewsNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.viewControllers = @[self.newsVC];
    self.navigationBar.topItem.title = @"News";
}

-(PHNewsTableViewController *)newsVC {
    if(!_newsVC) {
        _newsVC = [[PHNewsTableViewController alloc] init];
    }
    return _newsVC;
}

@end
