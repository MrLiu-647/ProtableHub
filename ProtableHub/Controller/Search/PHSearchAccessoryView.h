//
//  PHSearchAccessoryView.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/15.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    PH_SearchType_Users,
    PH_SearchType_Repos
}PHSearchType;

@protocol PHSearchTypeDelegate <NSObject>

@optional
-(void)searchDataWithInfo:(PHSearchType)searchType;

@end

@interface PHSearchAccessoryView : UIView

@property (nonatomic,weak) id<PHSearchTypeDelegate> delegate;

-(void)addSegmentControlWithFrame:(CGRect)frame titles:(NSArray *)titles;
-(void)addSortTypeBtnWithFrame:(CGRect)frame;

@end
