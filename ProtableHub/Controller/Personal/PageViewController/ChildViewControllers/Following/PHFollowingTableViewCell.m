//
//  PHFollowingTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowingTableViewCell.h"
#import "PHPageItem.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>

@implementation PHFollowingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self buildCellStructure];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

-(void)buildCellStructure {
    __weak typeof(self) weakSelf = self;
    [self.contentView addSubview:self.followingIcon];
    [self.followingIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
        make.left.mas_equalTo(weakSelf.mas_left).offset(5);
    }];
    [self.contentView addSubview:self.followingName];
    [self.followingName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
        make.left.mas_equalTo(weakSelf.followingIcon.mas_right).offset(5);
    }];
}

-(void)setObject:(id)object {
    [self.followingIcon sd_setImageWithURL:[NSURL URLWithString:((PHFollowingItem *)object).followingIcon]];
    self.followingName.text = ((PHFollowingItem *)object).followingName;
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60.0f;
}

+(CGFloat)tableView:(UITableView *)tableView headerHeightForSection:(NSInteger)section {
    return 20.0f;
}

-(UIImageView *)followingIcon {
    if(!_followingIcon) {
        _followingIcon = [[UIImageView alloc] init];
        _followingIcon.layer.cornerRadius = 10;
        _followingIcon.backgroundColor = UIColor.lightGrayColor;
        _followingIcon.clipsToBounds = true;
    }
    return _followingIcon;
}

-(UILabel *)followingName {
    if(!_followingName) {
        _followingName = [[UILabel alloc] init];
        _followingName.textAlignment = NSTextAlignmentLeft;
        [_followingName sizeToFit];
        _followingName.numberOfLines = 1;
        _followingName.preferredMaxLayoutWidth = 300.0;
    }
    return _followingName;
}

-(UILabel *)followingIntro {
    if(!_followingIntro) {
        _followingIntro = [[UILabel alloc] init];
        _followingIntro.textAlignment = NSTextAlignmentLeft;
    }
    return _followingIntro;
}

@end
