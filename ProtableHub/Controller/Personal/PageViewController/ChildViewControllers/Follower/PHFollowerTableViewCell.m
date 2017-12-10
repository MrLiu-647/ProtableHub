//
//  PHFollowerTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowerTableViewCell.h"
#import "PHPageItem.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>

@implementation PHFollowerTableViewCell

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
    [self.contentView addSubview:self.followerIcon];
    [self.followerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
        make.left.mas_equalTo(weakSelf.mas_left).offset(5);
    }];
    [self.contentView addSubview:self.followerName];
    [self.followerName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.followerIcon.mas_right).offset(5);
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
    }];
}

-(void)setObject:(id)object {
    [self.followerIcon sd_setImageWithURL:[NSURL URLWithString:((PHPageItem *)object).followerIcon]];
    self.followerName.text = ((PHPageItem *)object).followerName;
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60.0f;
}

+(CGFloat)tableView:(UITableView *)tableView headerHeightForSection:(NSInteger)section {
    return 20.0f;
}

-(UIImageView *)followerIcon {
    if(!_followerIcon) {
        _followerIcon = [[UIImageView alloc] init];
        _followerIcon.clipsToBounds = true;
        _followerIcon.backgroundColor = UIColor.lightGrayColor;
        _followerIcon.layer.cornerRadius = 10;
    }
    return _followerIcon;
}

-(UILabel *)followerName {
    if(!_followerName) {
        _followerName = [[UILabel alloc] init];
        _followerName.textAlignment = NSTextAlignmentLeft;
        _followerName.preferredMaxLayoutWidth = 300.0;
        _followerName.numberOfLines = 1;
        [_followerName sizeToFit];
    }
    return _followerName;
}

-(UILabel *)followerIntro {
    if(!_followerIntro) {
        _followerIntro = [[UILabel alloc] init];
        _followerIntro.textAlignment = NSTextAlignmentLeft;
    }
    return _followerIntro;
}

@end
