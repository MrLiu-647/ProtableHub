//
//  PHSearchContentManager.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/14.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHSearchAccessoryView.h"

@interface PHSearchContentManager : NSObject <UISearchBarDelegate,PHSearchTypeDelegate>

@property (nonatomic,copy) NSString *currentSearchType;

@end

