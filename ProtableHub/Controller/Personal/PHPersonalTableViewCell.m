//
//  PHPersonalTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/21.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHPersonalTableViewCell.h"
#import "PHPersonalItem.h"

@implementation PHPersonalTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self buildCellStructure];
}

-(void)buildCellStructure {
    self.userAvatars.frame = CGRectMake(10, 10, self.frame.size.height - 10, self.frame.size.height - 20);
    [self.contentView addSubview:self.userAvatars];
    self.userName.frame = CGRectMake(10+self.userAvatars.frame.size.width+10, 10, 200 , self.userAvatars.frame.size.height/3.0);
    [self.contentView addSubview:self.userName];
    self.signature.frame = CGRectMake(10+self.userAvatars.frame.size.width+10, 10+self.userName.frame.size.height, 200 , self.userAvatars.frame.size.height/3.0);
    [self.contentView addSubview:self.signature];
    self.stars.frame = CGRectMake(10+self.userAvatars.frame.size.width+10, 10+self.userName.frame.size.height*2, 200 , self.userAvatars.frame.size.height/3.0);
    [self.contentView addSubview:self.stars];
}

-(void)setObject:(id)object {
    self.userAvatars.image = [UIImage imageWithData:((PHPersonalItem *)object).userAvatars];
    self.userName.text = [[NSString alloc] initWithFormat:@"Name(%@)",((PHPersonalItem *)object).userName];
    self.signature.text = [[NSString alloc] initWithFormat:@"\"%@\"",((PHPersonalItem *)object).signature];
    self.stars.text = [[NSString alloc] initWithFormat:@"Stars:%@",((PHPersonalItem *)object).stars];
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 100.0f;
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
    }
    return _userName;
}

-(UILabel *)signature {
    if(!_signature) {
        _signature = [[UILabel alloc] init];
        [_signature setTextColor:UIColor.lightGrayColor];
        _signature.textAlignment = NSTextAlignmentLeft;
    }
    return _signature;
}

-(UILabel *)stars {
    if(!_stars) {
        _stars = [[UILabel alloc] init];
        [_stars setTextColor:UIColor.redColor];
        _stars.textAlignment = NSTextAlignmentLeft;
    }
    return _stars;
}

@end

@implementation PHPersonalFameCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self buildCellStructure];
}

-(void)buildCellStructure {
    UILabel *signal;
    self.repositories.frame = CGRectMake(10, 5, (self.frame.size.width-40)/3, (self.frame.size.height-10)/2);
    signal = [[UILabel alloc] initWithFrame:CGRectMake(10, 5+(self.frame.size.height-10)/2, (self.frame.size.width-40)/3, (self.frame.size.height-10)/2)];
    signal.text = @"Repositories";
    signal.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:signal];
    [self.contentView addSubview:self.repositories];
    self.followers.frame = CGRectMake(10+(self.frame.size.width-40)/3+10, 5, (self.frame.size.width-40)/3, (self.frame.size.height-10)/2);
    signal = [[UILabel alloc] initWithFrame:CGRectMake(10+(self.frame.size.width-40)/3+10, 5+(self.frame.size.height-10)/2, (self.frame.size.width-40)/3, (self.frame.size.height-10)/2)];
    signal.text = @"Followers";
    signal.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:signal];
    [self.contentView addSubview:self.followers];
    self.following.frame = CGRectMake(10+((self.frame.size.width-40)/3)*2+10+10, 5, (self.frame.size.width-40)/3, (self.frame.size.height-10)/2);
    signal = [[UILabel alloc] initWithFrame:CGRectMake(10+((self.frame.size.width-40)/3)*2+10+10, 5+(self.frame.size.height-10)/2, (self.frame.size.width-40)/3, (self.frame.size.height-10)/2)];
    signal.text = @"Following";
    signal.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:signal];
    [self.contentView addSubview:self.following];
}

-(void)setObject:(id)object {
    self.repositories.text = ((PHPersonalItem *)object).repositories;
    self.followers.text = ((PHPersonalItem *)object).followers;
    self.following.text = ((PHPersonalItem *)object).following;
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60.0f;
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
