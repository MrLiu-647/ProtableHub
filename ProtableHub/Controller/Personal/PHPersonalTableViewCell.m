//
//  PHPersonalTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalTableViewCell.h"
#import "PHPersonalItem.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@implementation PHPersonalTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)buildCellStructure {
    __weak typeof(self) weakSelf = self;
    [self.contentView addSubview:self.userAvatars];
    [self.userAvatars mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
        make.left.mas_equalTo(weakSelf.mas_left).offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    [self.contentView addSubview:self.userName];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
        make.left.mas_equalTo(weakSelf.userAvatars.mas_right).offset(5);
    }];
    [self.contentView addSubview:self.signature];
    [self.signature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.userName.mas_bottom);
        make.left.mas_equalTo(weakSelf.userAvatars.mas_right).offset(5);
    }];
    [self.contentView addSubview:self.createdDate];
    [self.createdDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.signature.mas_bottom);
        make.left.mas_equalTo(weakSelf.userAvatars.mas_right).offset(5);
    }];
}

-(void)setObject:(id)object {
    [self buildCellStructure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.userAvatars sd_setImageWithURL:[NSURL URLWithString:((PHPersonalItem *)object).userAvatars]];
    self.userName.text = [[NSString alloc] initWithFormat:@"Name(%@)",((PHPersonalItem *)object).userName];
    self.signature.text = [[NSString alloc] initWithFormat:@"\"%@\"",((PHPersonalItem *)object).userSignature];
    if((((PHPersonalItem *)object).userCreatedDate).length > 10) {
        self.createdDate.text = [[NSString alloc] initWithFormat:@"Joined on %@",[(((PHPersonalItem *)object).userCreatedDate) substringToIndex:10]];
    }
    else {
        self.createdDate.text = [[NSString alloc] initWithFormat:@"Joined on %@",((PHPersonalItem *)object).userCreatedDate];
    }
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 90.0f;
}

-(UIImageView *)userAvatars {
    if(!_userAvatars) {
        _userAvatars = [[UIImageView alloc] init];
        _userAvatars.clipsToBounds = true;
        _userAvatars.backgroundColor = UIColor.lightGrayColor;
        _userAvatars.layer.cornerRadius = 10;
    }
    return _userAvatars;
}

-(UILabel *)userName {
    if(!_userName) {
        _userName = [[UILabel alloc] init];
        [_userName setTextColor:[UIColor colorWithRed:0/255.0 green:116/255.0 blue:255/255.0 alpha:1.0]];
        _userName.textAlignment = NSTextAlignmentLeft;
        [_userName sizeToFit];
        _userName.preferredMaxLayoutWidth = 240.0;
        _userName.lineBreakMode = NSLineBreakByTruncatingTail;
        _userName.numberOfLines = 1;
    }
    return _userName;
}

-(UILabel *)signature {
    if(!_signature) {
        _signature = [[UILabel alloc] init];
        [_signature setTextColor:UIColor.lightGrayColor];
        _signature.numberOfLines = 2;
        [_signature sizeToFit];
        _signature.preferredMaxLayoutWidth = 240.0;
        _signature.lineBreakMode = NSLineBreakByTruncatingTail;
        _signature.textAlignment = NSTextAlignmentLeft;
    }
    return _signature;
}

-(UILabel *)createdDate {
    if(!_createdDate) {
        _createdDate = [[UILabel alloc] init];
        [_createdDate setTextColor:UIColor.redColor];
        _createdDate.textAlignment = NSTextAlignmentLeft;
        _createdDate.preferredMaxLayoutWidth = 240.0;
        _createdDate.lineBreakMode = NSLineBreakByTruncatingTail;
        [_createdDate sizeToFit];
        _createdDate.numberOfLines = 1;
    }
    return _createdDate;
}

@end

@implementation PHPersonalFameCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)buildCellStructure {
    __weak typeof(self) weakSelf = self;
    UILabel *firstSignal = [[UILabel alloc] init];
    [self.contentView addSubview:self.repositories];
    [self.contentView addSubview:firstSignal];
    [self.repositories mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(1);
        make.top.equalTo(weakSelf.mas_top);
        make.height.equalTo(weakSelf.mas_height).multipliedBy(0.5f);
        make.width.equalTo(weakSelf.mas_width).multipliedBy(0.33f);
    }];
    firstSignal.text = @"Repositories";
    firstSignal.textAlignment = NSTextAlignmentCenter;
    [firstSignal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.repositories);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(1);
    }];
    UILabel *secondSignal = [[UILabel alloc] init];
    secondSignal.text = @"Followers";
    secondSignal.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:secondSignal];
    [self.contentView addSubview:self.followers];
    [self.followers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.repositories);
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.repositories.mas_right).offset(1);
    }];
    [secondSignal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.repositories);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(firstSignal.mas_right).offset(1);
    }];
    UILabel *thirdSignal = [[UILabel alloc] init];
    thirdSignal.text = @"Followings";
    thirdSignal.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:thirdSignal];
    [self.contentView addSubview:self.following];
    [self.following mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.repositories);
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.followers.mas_right).offset(1);
    }];
    [thirdSignal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.repositories);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(secondSignal.mas_right).offset(1);
    }];
}

-(void)setObject:(id)object {
    [self buildCellStructure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.repositories.text = ((PHPersonalDetailItem *)object).repositories;
    self.followers.text = ((PHPersonalDetailItem *)object).followers;
    self.following.text = ((PHPersonalDetailItem *)object).following;
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60.0f;
}

+(CGFloat)tableView:(UITableView *)tableView headerHeightForSection:(NSInteger)section {
    return 1.0f;
}

-(UILabel *)repositories {
    if(!_repositories) {
        _repositories = [[UILabel alloc] init];
        _repositories.textAlignment = NSTextAlignmentCenter;
    }
    return _repositories;
}

-(UILabel *)followers {
    if(!_followers) {
        _followers = [[UILabel alloc] init];
        _followers.textAlignment = NSTextAlignmentCenter;
    }
    return _followers;
}

-(UILabel *)following {
    if(!_following) {
        _following = [[UILabel alloc] init];
        _following.textAlignment = NSTextAlignmentCenter;
    }
    return _following;
}

@end
