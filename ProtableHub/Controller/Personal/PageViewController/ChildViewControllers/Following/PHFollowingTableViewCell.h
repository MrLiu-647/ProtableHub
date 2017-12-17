//
//  PHFollowingTableViewCell.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableViewCell.h"

@interface PHFollowingTableViewCell : DTTableViewCell

@property (nonatomic,strong) UIImageView *followingIcon;
@property (nonatomic,strong) UILabel *followingName;
@property (nonatomic,strong) UILabel *followingIntro;
@property (nonatomic,strong) UILabel *followingUrl;

@end
