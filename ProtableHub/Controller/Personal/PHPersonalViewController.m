//
//  PHPersonalViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalViewController.h"
#import "PHPersonalDataSource.h"

#define HeightForNavigationBar UIScreen.mainScreen.bounds.size.height/9.5

@interface PHPersonalViewController ()

@property (nonatomic,strong) PHPersonalDataSource *phDataSource;

@end

@implementation PHPersonalViewController

- (void)viewDidLoad {
    self.heightForNavigationBar = HeightForNavigationBar;
    self.dtBarColor = UIColor.whiteColor;
    self.navigationTitle.text = @"Profile";
    [super viewDidLoad];
    [self.tableView setScrollEnabled:false];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColor.lightGrayColor;
}

-(id)createDataSource {
    _phDataSource = [[PHPersonalDataSource alloc] init];
    return _phDataSource;
}

@end
