//
//  YXLDockCell.m
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import "YXLDockCell.h"
#import "MJExtension.h"
@interface YXLDockCell ()
{
    UIButton *buttonBackground;
    UILabel *labelTitle;
    UILabel *labelQuantity;
    UIView *viewShow;
}
@end

@implementation YXLDockCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"YXLDockCell";
    YXLDockCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YXLDockCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configCell];
    }
    return self;
}

-(void)configCell{
    
    
    labelTitle = [self getLabelTitle];
    [self.contentView addSubview:labelTitle];
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    viewShow =[UIView new];
    viewShow.backgroundColor=[UIColor blackColor];
    [self.contentView addSubview:viewShow];
    [viewShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.left.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(75, 1));
    }];
}


-(void)clickButtonBackground{
    
}


-(void)setDockModel:(YXLDockModel *)dockModel{
    _dockModel=dockModel;
//    _dockModel=[YXLDockModel objectWithKeyValues:dockModel];
    labelTitle.text =_dockModel.commodityDockName;
    
}

#pragma -make 初始化



-(UILabel *)getLabelTitle{
    UILabel *label =[UILabel new];
    label.font=[UIFont systemFontOfSize:14];
    label.textColor=[UIColor blackColor];
    return label;
}

-(UILabel *)getLabelQuantity{
    UILabel *label =[UILabel new];
    label.font=[UIFont systemFontOfSize:9];
    label.textColor=[UIColor redColor];
    return label;
}
@end
