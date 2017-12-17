//
//  PHSearchAccessoryView.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/15.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHSearchAccessoryView.h"

@interface PHSearchAccessoryView ()

@property (nonatomic,strong) UISegmentedControl *searchTypeControl;
@property (nonatomic,strong) UIButton *sortTypeBtn;

@end

@implementation PHSearchAccessoryView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    }
    return self;
}

-(void)addSegmentControlWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self.searchTypeControl = [[UISegmentedControl alloc] initWithItems:titles];
    self.searchTypeControl.frame = frame;
    self.searchTypeControl.selectedSegmentIndex = 0;
    self.searchTypeControl.tintColor = UIColor.grayColor;
    [self.searchTypeControl addTarget:self action:@selector(postCurrentSearchType) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.searchTypeControl];
}

-(void)postCurrentSearchType {
    if(self.searchTypeControl.selectedSegmentIndex == 0) {
        [self.delegate searchDataWithInfo:PH_SearchType_Repos];
    }else {
        [self.delegate searchDataWithInfo:PH_SearchType_Users];
    }
    
}

-(void)addSortTypeBtnWithFrame:(CGRect)frame {
    self.sortTypeBtn = [[UIButton alloc] initWithFrame:frame];
    [self.sortTypeBtn setImage:[UIImage imageNamed:@"sliders"] forState:UIControlStateNormal];
    [self.sortTypeBtn addTarget:self action:@selector(listSearchConditions) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sortTypeBtn];
}

-(void)listSearchConditions {
    
}

@end
