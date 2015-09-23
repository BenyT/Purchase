//
//  YXLCommodityModel.h
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXLCommodityModel : NSObject
/**
 *  商品ID
 */
@property (nonatomic ,copy) NSString *ID;
/**
 *  商品Name
 */
@property (nonatomic ,copy) NSString *commodityName;
/**
 *  商品图片
 */
@property (nonatomic ,copy) NSString *commodityImageURL;
/**
 *  商品价格
 */
@property (nonatomic ,copy) NSString *commodityPrice;
/**
 *  商品优惠价格
 */
@property (nonatomic ,copy) NSString *commodityDiscountedPrices;
/**
 *  商品数量
 */
@property (nonatomic ,copy) NSString *commodityDiscountedQuantity;


@end
