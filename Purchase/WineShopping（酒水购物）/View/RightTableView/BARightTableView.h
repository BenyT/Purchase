//
//  BARightTableView.h
//  酒吧助手
//
//  Created by 叶星龙 on 15/5/22.
//  Copyright (c) 2015年 北京局外者科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RightTableViewDelegate <NSObject>

-(void)quantity:(NSInteger)quantity money:(NSInteger)money key:(NSString *)key;

@end

@interface BARightTableView : UITableView

@property (nonatomic ,strong) NSMutableArray *rightArray;


@property (nonatomic ,weak) id<RightTableViewDelegate>rightDelegate;
@end
