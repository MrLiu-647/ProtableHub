//
//  PHPageViewDataSource.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPageViewDataSource.h"

@implementation PHPageViewDataSource

-(instancetype)init {
    self = [super init];
    if(self) {
        self.containedPages = @[[PHRepoViewController class],[PHFollowerViewController class],[PHFollowingViewController class]];
    }
    return self;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger currentIndex = [self.containedPages indexOfObject:[viewController class]];
    NSInteger nextIndex = currentIndex + 1;
    if(nextIndex > self.containedPages.count - 1 || nextIndex < 0) {
        return nil;
    }
    id instance = [[self.containedPages[nextIndex] alloc] init];
    self.followingVC = instance;
    return instance;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger currentIndex = [self.containedPages indexOfObject:[viewController class]];
    NSInteger nextIndex = currentIndex - 1;
    if(nextIndex > self.containedPages.count - 1 || nextIndex < 0) {
        return nil;
    }
    id instance = [[self.containedPages[nextIndex] alloc] init];
    self.repoVC = instance;
    return instance;
}

@end
