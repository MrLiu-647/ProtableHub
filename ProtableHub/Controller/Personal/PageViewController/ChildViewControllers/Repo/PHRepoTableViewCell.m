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
    
}

-(void)setObject:(id)object {
    
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60.0f;
}

-(UILabel *)repoName {
    if(!_repoName) {
        _repoName = [[UILabel alloc] init];
    }
    return _repoName;
}

-(UILabel *)repoIntro {
    if(!_repoIntro) {
        _repoIntro = [[UILabel alloc] init];
    }
    return _repoIntro;
}

-(UILabel *)repoDetails {
    if(!_repoDetails) {
        _repoDetails = [[UILabel alloc] init];
    }
    return _repoDetails;
}

-(UILabel *)repoMainLanguage {
    if(!_repoMainLanguage) {
        _repoMainLanguage = [[UILabel alloc] init];
    }
    return _repoMainLanguage;
}

@end
