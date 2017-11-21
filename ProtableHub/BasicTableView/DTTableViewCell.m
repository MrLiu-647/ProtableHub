//
//  DTTableViewCell.m
//  DTTableView
//
//  Created by 俞清源 on 2017/11/12.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTTableViewCell.h"
#import "DTBasicItem.h"

@implementation DTTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setObject:(id)object {
    self.textLabel.text = ((DTBasicItem *)object).itemTitle;
    self.detailTextLabel.text = ((DTBasicItem *)object).itemSubtitle;
    self.imageView.image = ((DTBasicItem *)object).itemImage;
    self.accessoryView = [[UIImageView alloc] initWithImage:((DTBasicItem *)object).itemAccessoryImage];
}

//根据cell中元素来调整cell的大小,可由子类重写
+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 44;
}

//根据section来调整header的高度,可由子类重写
+(CGFloat)tableView:(UITableView *)tableView headerHeightForSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end

