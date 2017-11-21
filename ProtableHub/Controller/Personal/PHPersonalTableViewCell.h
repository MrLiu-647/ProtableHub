//
//  PHPersonalTableViewCell.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableViewCell.h"

@interface PHPersonalTableViewCell : DTTableViewCell

@property (nonatomic,strong) UIImageView *userAvatars;
@property (nonatomic,strong) UILabel *userName;
@property (nonatomic,strong) UILabel *signature;
@property (nonatomic,strong) UILabel *stars;
//以下为可选信息
@property (nonatomic,strong) UILabel *userCompany;
@property (nonatomic,strong) UILabel *userMail;
@property (nonatomic,strong) UILabel *userLocation;

@end

@interface PHPersonalFameCell :DTTableViewCell

@property (nonatomic,strong) UILabel *repositories;
@property (nonatomic,strong) UILabel *followers;
@property (nonatomic,strong) UILabel *following;

@end
