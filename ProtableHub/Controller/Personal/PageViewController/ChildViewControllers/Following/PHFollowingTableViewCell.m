//
//  PHFollowingTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowingTableViewCell.h"
#import "PHPageItem.h"

@implementation PHFollowingTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    [self buildCellStructure];
}

-(void)buildCellStructure {
    
}

-(void)setObject:(id)object {
    
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60.0f;
}

-(UIImageView *)followingIcon {
    if(!_followingIcon) {
        _followingIcon = [[UIImageView alloc] init];
    }
    return _followingIcon;
}

-(UILabel *)followingName {
    if(!_followingName) {
        _followingName = [[UILabel alloc] init];
    }
    return _followingName;
}

-(UILabel *)followingIntro {
    if(!_followingIntro) {
        _followingIntro = [[UILabel alloc] init];
    }
    return _followingIntro;
}

@end
