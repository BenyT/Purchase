//
//  YXLDockTableView.h
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXLDockModel.h"
@protocol dockTavleViewDelegate <NSObject>

-(void)clickDockindexPathRow:(YXLDockModel *)dockModel;

@end

@interface YXLDockTableView : UITableView

@property (nonatomic ,strong) NSMutableArray *dockArray;

@property (nonatomic ,weak) id<dockTavleViewDelegate>delegateDock;

@end
