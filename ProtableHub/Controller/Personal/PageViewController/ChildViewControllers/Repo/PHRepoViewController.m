//
//  PHRepoViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHRepoViewController.h"
#import "PHRepoDataSource.h"

@interface PHRepoViewController ()

@property (nonatomic,strong) PHRepoDataSource *repoDataSource;

@end

@implementation PHRepoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self.repoDataSource;
    self.tableView.backgroundColor = UIColor.blueColor;
}

-(id)createDataSource {
    _repoDataSource = [[PHRepoDataSource alloc] init];
    return _repoDataSource;
}

@end
