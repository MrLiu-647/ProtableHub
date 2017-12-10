//
//  PHRepoTableViewCell.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/22.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHRepoTableViewCell.h"
#import "PHPageItem.h"
#import <Masonry.h>

@implementation PHRepoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self buildCellStructure];
    }
    return self;
}

-(void)buildCellStructure {
    __weak typeof(self) weakSelf = self;
    [self.contentView addSubview:self.repoType];
    [self.repoType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
        make.left.mas_equalTo(weakSelf.mas_left).offset(10);
    }];
    [self.contentView addSubview:self.repoName];
    [self.repoName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.repoType.mas_right).offset(5);
        make.top.mas_equalTo(weakSelf.mas_top).offset(5);
    }];
    [self.contentView addSubview:self.repoIntro];
    [self.repoIntro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.repoType.mas_right).offset(5);
        make.top.mas_equalTo(weakSelf.repoName.mas_bottom).offset(1);
    }];
    [self.contentView addSubview:self.repoMainLanguage];
    [self.repoMainLanguage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.repoType.mas_right).offset(5);
        make.top.mas_equalTo(weakSelf.repoIntro.mas_bottom).offset(1);
    }];
    [self.contentView addSubview:self.repoStar];
    [self.repoStar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakSelf.mas_right).offset(-10);
        make.top.mas_equalTo(weakSelf.repoIntro.mas_bottom).offset(1);
    }];
}

-(void)setObject:(id)object {
    self.repoName.text = [[NSString alloc] initWithFormat:@"Repo:%@",((PHRepoItem *)object).repoName];
    self.repoIntro.text = [[NSString alloc] initWithFormat:@"%@",((PHRepoItem *)object).repoIntro];
    self.repoMainLanguage.text = [[NSString alloc] initWithFormat:@"Language:%@",((PHRepoItem *)object).repoMainLanguage];
    if([((PHRepoItem *)object).repoType isEqualToString:@"1"]) {
        self.repoType.image = [UIImage imageNamed:@"fa-fork"];
    }else {
        self.repoType.image = [UIImage imageNamed:@"fa-book"];
    }
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"stars"];
    attach.bounds = CGRectMake(0, 0, 16, 16);
    NSAttributedString *attributedString = [NSAttributedString attributedStringWithAttachment:attach];
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithString:((PHRepoItem *)object).repoStarsCount];
    [textString appendAttributedString:attributedString];
    self.repoStar.attributedText = textString;
}

//根据intro里的内容大小来改变
+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    CGSize textSize = [((PHRepoItem *)object).repoIntro boundingRectWithSize:CGSizeMake(350, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]} context:nil].size;
    return textSize.height + 50.0;
}

+(CGFloat)tableView:(UITableView *)tableView headerHeightForSection:(NSInteger)section {
    return 20.0f;
}

-(UILabel *)repoName {
    if(!_repoName) {
        _repoName = [[UILabel alloc] init];
        _repoName.textAlignment = NSTextAlignmentLeft;
        [_repoName setTextColor:[UIColor colorWithRed:0/255.0 green:116/255.0 blue:255/255.0 alpha:1.0]];
        [_repoName sizeToFit];
        _repoName.numberOfLines = 1;
        _repoName.preferredMaxLayoutWidth = 250.0;
        _repoName.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _repoName;
}

-(UILabel *)repoIntro {
    if(!_repoIntro) {
        _repoIntro = [[UILabel alloc] init];
        _repoIntro.textAlignment = NSTextAlignmentLeft;
        _repoIntro.numberOfLines = 0;
        _repoIntro.preferredMaxLayoutWidth = 350.0;
        [_repoIntro sizeToFit];
        _repoIntro.lineBreakMode = NSLineBreakByTruncatingTail;
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

-(UIImageView *)repoType {
    if(!_repoType) {
        _repoType = [[UIImageView alloc] init];
    }
    return _repoType;
}

-(UILabel *)repoStar {
    if(!_repoStar) {
        _repoStar = [[UILabel alloc] init];
        _repoStar.numberOfLines = 1;
        _repoStar.textAlignment = NSTextAlignmentLeft;
        _repoStar.preferredMaxLayoutWidth = 150.0;
    }
    return _repoStar;
}

-(UILabel *)repoMainLanguage {
    if(!_repoMainLanguage) {
        _repoMainLanguage = [[UILabel alloc] init];
        _repoMainLanguage.textAlignment = NSTextAlignmentLeft;
        [_repoMainLanguage setTextColor:[UIColor colorWithRed:0/255.0 green:116/255.0 blue:255/255.0 alpha:1.0]];
        [_repoMainLanguage sizeToFit];
        _repoMainLanguage.preferredMaxLayoutWidth = 150.0;
        _repoMainLanguage.numberOfLines = 1;
        _repoMainLanguage.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _repoMainLanguage;
}

@end
