//
//  DTNavigationTableViewController.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/17.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTNavigationTableViewController.h"

@interface DTNavigationTableViewController ()

@end

@implementation DTNavigationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.fakeNavigationBar];
    [self changeTableView];
}

//修改tableView的尺寸
-(void)changeTableView {
    CGRect frame = self.tableView.frame;
    frame.origin.y = self.heightForNavigationBar;
    frame.size.height = frame.size.height - self.heightForNavigationBar;
    self.tableView.frame = frame;
}

-(CGFloat)heightForNavigationBar {
    if(!_heightForNavigationBar) {
        _heightForNavigationBar = 44.0;
    }
    return _heightForNavigationBar;
}

-(UIView *)fakeNavigationBar {
    if(!_fakeNavigationBar) {
        _fakeNavigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.heightForNavigationBar)];
        _fakeNavigationBar.backgroundColor = self.dtBarColor;
        //设置透明度
        [_fakeNavigationBar setAlpha:0.9];
    }
    return _fakeNavigationBar;
}

-(UILabel *)navigationTitle {
    if(!_navigationTitle) {
        _navigationTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.fakeNavigationBar.frame.size.height - 40, self.fakeNavigationBar.frame.size.width/2, 40)];
        CGPoint center = _navigationTitle.center;
        center.x = self.fakeNavigationBar.center.x;
        _navigationTitle.center = center;
        _navigationTitle.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22];
        _navigationTitle.textAlignment = NSTextAlignmentCenter;
        [self.fakeNavigationBar addSubview:_navigationTitle];
    }
    return _navigationTitle;
}

-(UIColor *)dtBarColor {
    if(!_dtBarColor) {
        _dtBarColor = UIColor.whiteColor;
    }
    return _dtBarColor;
}
@end

