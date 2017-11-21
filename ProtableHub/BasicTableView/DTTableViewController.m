//
//  ViewController.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.``
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableViewController.h"

@interface DTTableViewController ()

@end

@implementation DTTableViewController

-(instancetype)init {
    self = [super init];
    if(self) {
        _tableViewFrame.origin.x = -1000;
    }
    return self;
}

-(void)createTableView {
    if(!_tableView) {
        if(_tableViewFrame.origin.x < 0) {
            _tableView = [[DTTableView alloc] initWithFrame:self.view.bounds style:_style];
        }
        else {
            _tableView = [[DTTableView alloc] initWithFrame:self.tableViewFrame style:_style];
        }
        _tableView.dtDelegate = self;
        _tableView.dataSource = [self createDataSource];
        [self.view addSubview:_tableView];
    }
}

-(id)createDataSource {
    _dataSource = [[DTTableViewDataSource alloc] init];
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
}

@end
