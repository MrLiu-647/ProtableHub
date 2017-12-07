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

@implementation PHFollowingTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    self.accessoryType = UITableViewCellAccessoryDetailButton;
    [self buildCellStructure];
}

-(void)buildCellStructure {
    self.followingIcon.frame = CGRectMake(5, 5, self.frame.size.height - 10, self.frame.size.height - 10);
    [self.contentView addSubview:self.followingIcon];
    self.followingName.frame = CGRectMake(10+self.followingIcon.frame.size.width, 5, 200, self.followingIcon.frame.size.height/2);
    [self.contentView addSubview:self.followingName];
    self.followingIntro.frame = CGRectMake(10+self.followingIcon.frame.size.width, 5+self.followingName.frame.size.height, 200, self.followingIcon.frame.size.height/2);
    [self.contentView addSubview:self.followingIntro];
}

-(void)setObject:(id)object {
    [self.followingIcon sd_setImageWithURL:[NSURL URLWithString:((PHFollowingItem *)object).followingIcon]];
    self.followingName.text = ((PHFollowingItem *)object).followingName;
    self.followingIntro.text = ((PHFollowingItem *)object).followingIntro;
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
