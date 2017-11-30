//
//  PHPersonalNavigationViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/29.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalNavigationViewController.h"
#import "PHPersonalViewController.h"

@interface PHPersonalNavigationViewController ()

@property (nonatomic,strong) PHPersonalViewController *personalVC;

@end

@implementation PHPersonalNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.personalVC];
    self.navigationBar.topItem.title = @"Profile";
    self.tabBarItem.title = @"Profile";
    self.tabBarItem.image = [UIImage imageNamed:@"personal"];
}

-(PHPersonalViewController *)personalVC {
    if(!_personalVC) {
        _personalVC = [[PHPersonalViewController alloc] init];
    }
    return _personalVC;
}

@end
