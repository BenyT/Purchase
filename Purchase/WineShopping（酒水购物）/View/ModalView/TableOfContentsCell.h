//
//  TableOfContentsCell.h
//  BarAssistant
//
//  Created by 叶星龙 on 15/5/27.
//  Copyright (c) 2015年 北京局外者科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableOfContentsCell : UITableViewCell

@property (nonatomic ,strong) NSMutableDictionary *dicData;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic , copy) void (^TapActionBlock)(NSInteger pageIndex ,NSInteger money ,NSString *key);
@property (nonatomic , copy) void (^reloadDataBlock)(NSString *key);
@end
