//
//  YXLRightTableViewCell.h
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXLCommodityModel.h"

@interface YXLRightTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic ,strong) YXLCommodityModel *commodityModel;
@end
