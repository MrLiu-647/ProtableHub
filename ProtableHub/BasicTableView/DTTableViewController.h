//
//  ViewController.h
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTTableViewDataSource.h"
#import "DTTableView.h"

@protocol DTTableViewControllerDelegate

@required
-(id)createDataSource;

@end

@interface DTTableViewController : UIViewController<DTTableViewControllerDelegate,DTTableViewDelegate>

@property (nonatomic,strong) DTTableViewDataSource *dataSource;
@property (nonatomic,strong) DTTableView *tableView;

@property (nonatomic,assign) CGRect tableViewFrame;
@property (nonatomic,assign) UITableViewStyle style;

@end

