//
//  PHSearchContentManager.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/14.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHSearchContentManager.h"
#import "PHSearchModel.h"

@implementation PHSearchContentManager

-(instancetype)init {
    self = [super init];
    if(self) {
        self.currentSearchType = @"repositories";
    }
    return self;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"Begin editing");
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Button Clicked");
    [PHSearchModel.sharedInstance lanuchRequestWithParams:@{@"q":searchBar.text} requestMethod:PH_REQUEST_GET route:self.currentSearchType handler:nil];
}

-(void)searchDataWithInfo:(PHSearchType)searchType {
    if(searchType == PH_SearchType_Repos) {
        self.currentSearchType = @"repositories";
    }else {
        self.currentSearchType = @"users";
    }
}

@end
