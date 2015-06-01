//
//  TableOfContentsVC.h
//  BarAssistant
//
//  Created by 叶星龙 on 15/5/27.
//  Copyright (c) 2015年 北京局外者科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TableOfContentsVC : UIViewController

@property (strong ,nonatomic) NSMutableArray *array;
@property (strong ,nonatomic) UIView *topView;
@property (nonatomic , copy) void (^TableOfContentsBlock)();
@property (nonatomic , copy) void (^topLabelBlock)(NSMutableArray *array);
@property (nonatomic , copy) void (^TapActionBlock)(NSInteger pageIndex ,NSInteger money ,NSString *key);
@end
