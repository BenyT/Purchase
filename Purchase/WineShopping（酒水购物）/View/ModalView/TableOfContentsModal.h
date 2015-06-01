//
//  TableOfContentsModal.h
//  BarAssistant
//
//  Created by 叶星龙 on 15/5/27.
//  Copyright (c) 2015年 北京局外者科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TableOfContentsDelegate <NSObject>

-(void)quantity:(NSInteger)quantity money:(NSInteger)money key:(NSString *)key;

@end
@interface TableOfContentsModal : UIView

-(void)modal:(UIView *)cview array:(NSMutableArray *)array;


@property (nonatomic ,weak) id<TableOfContentsDelegate>TableOfContentsDelegate;
@property (nonatomic , copy) void (^TableOfContentsBlock)();
@property (nonatomic , copy) void (^tapLabelBlock)(NSMutableArray *array);
@end
