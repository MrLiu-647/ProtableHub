//
//  PHFollowerTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHFollowerTableViewCell.h"
#import "PHPageItem.h"

@implementation PHFollowerTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    [self buildCellStructure];
}

-(void)buildCellStructure {
    self.followerIcon.frame = CGRectMake(5, 5, self.frame.size.height - 10, self.frame.size.height - 10);
    [self.contentView addSubview:self.followerIcon];
    self.followerName.frame = CGRectMake(10+self.followerIcon.frame.size.width, 5, 200, self.followerIcon.frame.size.height/2);
    [self.contentView addSubview:self.followerName];
    self.followerIntro.frame = CGRectMake(10+self.followerIcon.frame.size.width, 5+self.followerName.frame.size.height, 200, self.followerIcon.frame.size.height/2);
    [self.contentView addSubview:self.followerIntro];
}

-(void)setObject:(id)object {
    self.followerIcon.image = [UIImage imageWithData:((PHPageItem *)object).followerIcon];
    self.followerName.text = ((PHPageItem *)object).followerName;
    self.followerIntro.text = ((PHPageItem *)object).followerIntro;
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60.0f;
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
