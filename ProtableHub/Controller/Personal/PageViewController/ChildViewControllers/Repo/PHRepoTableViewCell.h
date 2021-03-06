//
//  PHRepoTableViewCell.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableViewCell.h"

@interface PHRepoTableViewCell : DTTableViewCell

@property (nonatomic,strong) UILabel *repoName;
@property (nonatomic,strong) UILabel *repoIntro;
@property (nonatomic,strong) UILabel *repoMainLanguage;
@property (nonatomic,strong) UIImageView *repoType; //仓库类型
@property (nonatomic,strong) UILabel *repoStar;
//可选,README.md里的信息
@property (nonatomic,strong) UILabel *repoDetails;

@end
