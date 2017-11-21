//
//  PHTabBarController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHTabBarController.h"
#import "PHPersonalViewController.h"

@interface PHTabBarController ()

@property (nonatomic,strong) PHPersonalViewController *personalVC;

@end

@implementation PHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.personalVC];
}

-(PHPersonalViewController *)personalVC {
    if(!_personalVC) {
        _personalVC = [[PHPersonalViewController alloc] init];
        _personalVC.tabBarItem.title = @"Profile";
    }
    return _personalVC;
}

@end
