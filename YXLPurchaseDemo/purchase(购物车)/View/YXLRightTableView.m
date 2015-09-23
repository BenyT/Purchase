//
//  YXLRightTableView.m
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import "YXLRightTableView.h"
#import "YXLRightTableViewCell.h"
@interface YXLRightTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation YXLRightTableView

-(instancetype)init{
    self =[super init];
    if (self) {
        [self objectInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self objectInit];
    }
    return self;
}

-(void)objectInit
{
    self.dataSource=self;
    self.delegate=self;
    self.backgroundColor=[UIColor whiteColor];
    self.tableFooterView=[[UIView alloc]init];
    [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}


-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rightArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YXLRightTableViewCell *cell =[YXLRightTableViewCell cellWithTableView:tableView];
    cell.commodityModel =self.rightArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
