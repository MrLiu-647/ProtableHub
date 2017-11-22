//
//  PHFollowerViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowerViewController.h"
#import "PHFollowerDataSource.h"

@interface PHFollowerViewController ()

@property (nonatomic,strong) PHFollowerDataSource *followerDataSource;

@end

@implementation PHFollowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self.followerDataSource;
}

-(id)createDataSource {
    _followerDataSource = [[PHFollowerDataSource alloc] init];
    return _followerDataSource;
}

-(void)pullDownToRefresh {
    NSLog(@"下拉刷新");
}

@end
