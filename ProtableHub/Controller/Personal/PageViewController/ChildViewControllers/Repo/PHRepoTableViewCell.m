//
//  PHRepoTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHRepoTableViewCell.h"
#import "PHPageItem.h"

@implementation PHRepoTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    [self buildCellStructure];
}

-(void)buildCellStructure {
    self.repoName.frame = CGRectMake(5, 0, 250, self.frame.size.height/4);
    [self.contentView addSubview:self.repoName];
    self.repoIntro.frame = CGRectMake(5, self.frame.size.height/4, 250, self.frame.size.height/2);
    [self.contentView addSubview:self.repoIntro];
    self.repoMainLanguage.frame = CGRectMake(5, self.frame.size.height/4+self.frame.size.height/2, 250, self.frame.size.height/4);
    [self.contentView addSubview:self.repoMainLanguage];
}

-(void)setObject:(id)object {
    self.repoName.text = [[NSString alloc] initWithFormat:@"Repo:%@",((PHPageItem *)object).repoName];
    self.repoIntro.text = [[NSString alloc] initWithFormat:@"%@",((PHPageItem *)object).repoIntro];
    self.repoMainLanguage.text = [[NSString alloc] initWithFormat:@"Main Language:%@",((PHPageItem *)object).repoMainLanguage];
}

//根据intro里的内容大小来改变
+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 80.0f;
}

+(CGFloat)tableView:(UITableView *)tableView headerHeightForSection:(NSInteger)section {
    return 20.0f;
}

-(UILabel *)repoName {
    if(!_repoName) {
        _repoName = [[UILabel alloc] init];
        _repoName.textAlignment = NSTextAlignmentLeft;
        [_repoName setTextColor:[UIColor colorWithRed:0/255.0 green:116/255.0 blue:255/255.0 alpha:1.0]];
    }
    return _repoName;
}

-(UILabel *)repoIntro {
    if(!_repoIntro) {
        _repoIntro = [[UILabel alloc] init];
        _repoIntro.textAlignment = NSTextAlignmentLeft;
        _repoIntro.numberOfLines = 0;
        _repoIntro.lineBreakMode = NSLineBreakByCharWrapping;
        [_repoIntro setTextColor:UIColor.lightGrayColor];
    }
    return _repoIntro;
}

-(UILabel *)repoDetails {
    if(!_repoDetails) {
        _repoDetails = [[UILabel alloc] init];
        _repoDetails.textAlignment = NSTextAlignmentLeft;
    }
    return _repoDetails;
}

-(UILabel *)repoMainLanguage {
    if(!_repoMainLanguage) {
        _repoMainLanguage = [[UILabel alloc] init];
        _repoMainLanguage.textAlignment = NSTextAlignmentLeft;
        [_repoMainLanguage setTextColor:[UIColor colorWithRed:0/255.0 green:116/255.0 blue:255/255.0 alpha:1.0]];
    }
    return _repoMainLanguage;
}

@end
