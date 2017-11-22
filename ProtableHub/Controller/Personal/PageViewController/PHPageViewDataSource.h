//
//  PHPageViewDataSource.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PHRepoViewController.h"
#import "PHFollowerViewController.h"
#import "PHFollowingViewController.h"

@interface PHPageViewDataSource : NSObject<UIPageViewControllerDataSource>

@property (nonatomic,copy) NSArray *containedPages;

@end

