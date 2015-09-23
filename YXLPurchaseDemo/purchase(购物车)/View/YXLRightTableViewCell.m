//
//  YXLRightTableViewCell.m
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import "YXLRightTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface YXLRightTableViewCell ()
{
    UIImageView *imageViewCommodity;
    UILabel *labelCommodityName;
    UILabel *labelCommodityPrice;
    UILabel *labelCommodityDiscountedPrices;
    UILabel *labelCommodityDiscountedQuantity;
    UIButton *buttonAdd;
    UIButton *buttonLess;
    UIView *viewShow;
}
@end
@implementation YXLRightTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"YXLRightTableViewCell";
    YXLRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YXLRightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    imageViewCommodity = [UIImageView new];
    imageViewCommodity.backgroundColor=[UIColor lightGrayColor];
    imageViewCommodity.layer.masksToBounds=YES;
    imageViewCommodity.layer.cornerRadius=4;
    [self.contentView addSubview:imageViewCommodity];
    [imageViewCommodity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@5);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    labelCommodityName = [self getLabelCommodityName];
    [self.contentView addSubview:labelCommodityName];
    [labelCommodityName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewCommodity.mas_right).offset(5);
        make.top.equalTo(@5);
        make.width.equalTo(@(kWindowWidth-75-5-5-40));
        make.height.greaterThanOrEqualTo(@14);
    }];
    
    labelCommodityPrice = [self getLabelCommodityPrice];
    [self.contentView addSubview:labelCommodityPrice];
    [labelCommodityPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelCommodityName.mas_bottom).offset(5);
        make.left.equalTo(imageViewCommodity.mas_right).offset(5);
        make.height.equalTo(@9);
        make.width.greaterThanOrEqualTo(@40);
    }];
    
    labelCommodityDiscountedPrices = [self getLabelCommodityDiscountedPrices];
    [self.contentView addSubview:labelCommodityDiscountedPrices];
    [labelCommodityDiscountedPrices mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelCommodityPrice.mas_bottom).offset(5);
        make.left.equalTo(imageViewCommodity.mas_right).offset(5);
        make.height.equalTo(@9);
        make.width.greaterThanOrEqualTo(@40);
    }];
    
    
    buttonAdd = [self getButtonAdd];
    [buttonAdd addTarget:self action:@selector(clickButtonAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:buttonAdd];
    [buttonAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.size.mas_equalTo(CGSizeMake(20,20));
    }];
    
    labelCommodityDiscountedQuantity = [self getLabelCommodityDiscountedQuantity];
    [self.contentView addSubview:labelCommodityDiscountedQuantity];
    [labelCommodityDiscountedQuantity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(buttonAdd);
        make.right.equalTo(buttonAdd.mas_left);
        make.width.greaterThanOrEqualTo(@20);
        make.height.equalTo(@9);
    }];
    
    buttonLess = [self getButtonLess];
    [buttonLess addTarget:self action:@selector(clickButtonLess) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:buttonLess];
    [buttonLess mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(buttonAdd);
        make.right.equalTo(labelCommodityDiscountedQuantity.mas_left);
        make.size.mas_equalTo(CGSizeMake(20,20));
    }];
    
    
    viewShow =[UIView new];
    viewShow.backgroundColor=[UIColor blackColor];
    [self.contentView addSubview:viewShow];
    [viewShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.left.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth-75, 1));
    }];
    
}

#pragma -make 点击

-(void)clickButtonAdd{
    if ([_commodityModel.commodityDiscountedQuantity integerValue] >= 0 && [_commodityModel.commodityDiscountedQuantity integerValue] < 99) {
        labelCommodityDiscountedQuantity.text=[NSString stringWithFormat:@"%ld",1+[_commodityModel.commodityDiscountedQuantity integerValue]];
        _commodityModel.commodityDiscountedQuantity=labelCommodityDiscountedQuantity.text;
    }
    
}

-(void)clickButtonLess{
    if ([_commodityModel.commodityDiscountedQuantity integerValue] != 0 && [_commodityModel.commodityDiscountedQuantity integerValue] < 99) {
        labelCommodityDiscountedQuantity.text=[NSString stringWithFormat:@"%ld",[_commodityModel.commodityDiscountedQuantity integerValue]-1];
        _commodityModel.commodityDiscountedQuantity=labelCommodityDiscountedQuantity.text;
    }
}



-(void)setCommodityModel:(YXLCommodityModel *)commodityModel
{
    _commodityModel=commodityModel;
    [imageViewCommodity sd_setImageWithURL:[NSURL URLWithString:@"http://pic.nipic.com/2007-11-09/2007119122519868_2.jpg"] placeholderImage:nil];
    
    labelCommodityName.text=commodityModel.commodityName;
    
    labelCommodityPrice.text=[NSString stringWithFormat:@"%ld",[commodityModel.commodityPrice integerValue]];
    
    labelCommodityDiscountedPrices.text=[NSString stringWithFormat:@"%ld",[commodityModel.commodityDiscountedPrices integerValue]];
    
    labelCommodityDiscountedQuantity.text=[NSString stringWithFormat:@"%ld",[commodityModel.commodityDiscountedQuantity integerValue]];
    
    
    
}
#pragma  -make 初始化

-(UILabel *)getLabelCommodityName{
    UILabel *label =[UILabel new];
    label.font=[UIFont systemFontOfSize:14];
    label.textAlignment=NSTextAlignmentLeft;
    label.textColor=[UIColor blackColor];
    label.numberOfLines=0;
    return label;
}

-(UILabel *)getLabelCommodityPrice{
    UILabel *label =[UILabel new];
    label.font=[UIFont systemFontOfSize:9];
    label.textAlignment=NSTextAlignmentLeft;
    label.textColor=[UIColor blackColor];
    return label;
}

-(UILabel *)getLabelCommodityDiscountedPrices{
    UILabel *label =[UILabel new];
    label.font=[UIFont systemFontOfSize:9];
    label.textAlignment=NSTextAlignmentLeft;
    label.textColor=[UIColor lightGrayColor];
    return label;
}

-(UILabel *)getLabelCommodityDiscountedQuantity{
    UILabel *label =[UILabel new];
    label.font=[UIFont systemFontOfSize:9];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor lightGrayColor];
    return label;
}

-(UIButton *)getButtonAdd{
    UIButton *btn =[UIButton new];
    [btn setTitle:@"+" forState:UIControlStateNormal];
    [btn setTitle:@"+" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];

    btn.layer.borderColor=[UIColor redColor].CGColor;
    btn.layer.borderWidth=0.5;
    return btn;
}
-(UIButton *)getButtonLess{
    UIButton *btn =[UIButton new];
    [btn setTitle:@"-" forState:UIControlStateNormal];
    [btn setTitle:@"-" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    btn.layer.borderColor=[UIColor redColor].CGColor;
    btn.layer.borderWidth=0.5;
    return btn;
}
@end
