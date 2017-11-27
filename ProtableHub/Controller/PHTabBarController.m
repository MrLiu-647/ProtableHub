//
//  PHTabBarController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHTabBarController.h"
#import "PHPersonalViewController.h"

#import "DTBaseModel.h"

@interface PHTabBarController ()

@property (nonatomic,strong) PHPersonalViewController *personalVC;

@property (nonatomic,strong) DTBaseModel *model;

@end

@implementation PHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.personalVC];
    
    self.model = [[DTBaseModel alloc] initWithServerAddress:@"https://api.github.com/" route:@"users/halfrost/following"];
    [self.model lanuchRequestWithParams:nil requestMethod:PH_REQUEST_GET];
}

-(PHPersonalViewController *)personalVC {
    if(!_personalVC) {
        _personalVC = [[PHPersonalViewController alloc] init];
        _personalVC.tabBarItem.title = @"Profile";
    }
    return _personalVC;
}

@end
