//
//  PHTabBarController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHTabBarController.h"
#import "PHPersonalNavigationViewController.h"

@interface PHTabBarController ()

@property (nonatomic,strong) PHPersonalNavigationViewController *personalVC;

@end

@implementation PHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.personalVC];
}

-(PHPersonalNavigationViewController *)personalVC {
    if(!_personalVC) {
        _personalVC = [[PHPersonalNavigationViewController alloc] init];
    }
    return _personalVC;
}

@end
