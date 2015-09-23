//
//  YXLDockModel.m
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import "YXLDockModel.h"
#import "MJExtension.h"
#import "YXLCommodityModel.h"
@implementation YXLDockModel

-(void)setCommodityArray:(NSMutableArray *)commodityArray{
    _commodityArray =[NSMutableArray array];
    if (commodityArray.count==0) {
        return;
    }
    NSArray *array =[YXLCommodityModel objectArrayWithKeyValuesArray:commodityArray];
    [_commodityArray addObjectsFromArray:array];
}
@end
