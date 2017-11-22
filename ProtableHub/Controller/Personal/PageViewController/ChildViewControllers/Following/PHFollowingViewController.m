//
//  PHFollowingViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowingViewController.h"
#import "PHFollowingDataSource.h"

@interface PHFollowingViewController ()

@property (nonatomic,strong) PHFollowingDataSource *followingDataSource;

@end

@implementation PHFollowingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self.followingDataSource;
    self.tableView.backgroundColor = UIColor.yellowColor;
}

-(id)createDataSource {
    _followingDataSource = [[PHFollowingDataSource alloc] init];
    return _followingDataSource;
}

@end
