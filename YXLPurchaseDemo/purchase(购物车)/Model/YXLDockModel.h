//
//  YXLDockModel.h
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXLDockModel : NSObject

/**
 *  类型名称
 */
@property (nonatomic ,copy) NSString *commodityDockName;
/**
 *  类型里面数据
 */
@property (nonatomic ,strong) NSMutableArray *commodityArray;

@end
