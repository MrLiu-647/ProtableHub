//
//  DTTableView+PullUpRefresh.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/20.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableView+PullUpRefresh.h"

@implementation DTTableView (PullUpRefresh)

-(void)addPullUpRefreshAction {
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGPoint currentOffset = [change[@"new"] CGPointValue];
    if(self.bounds.size.height + currentOffset.y > self.contentSize.height + 60.5 && !self.isRefreshing) {
        self.isRefreshing = true;
        [UIView animateWithDuration:1.0 animations:^{
            self.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
            [self.dtDelegate pullUpToRefresh:^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:1 animations:^{
                        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                    } completion:^(BOOL finished) {
                        self.isRefreshing = false;
                    }];
                });
            } fail:^{
                [UIView animateWithDuration:1 animations:^{
                    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                } completion:^(BOOL finished) {
                    self.isRefreshing = false;
                }];
            }];
        }];
    }
}

@end
