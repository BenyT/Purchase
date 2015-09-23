//
//  YXLDockTableView.m
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import "YXLDockTableView.h"
#import "YXLDockCell.h"
@interface YXLDockTableView ()<UITableViewDataSource,UITableViewDelegate>
{
    NSIndexPath *index;
    BOOL isSelected;
}
@end

@implementation YXLDockTableView

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

-(void)objectInit{
    self.dataSource=self;
    self.delegate=self;
    self.backgroundColor=[UIColor whiteColor];
    self.tableFooterView=[[UIView alloc]init];
//    [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if(!isSelected)
    {
        NSInteger selectedIndex = 0;
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        [self tableView:self didSelectRowAtIndexPath:selectedIndexPath];
        isSelected=YES;
    }
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dockArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YXLDockCell *cell =[YXLDockCell cellWithTableView:tableView];
    cell.dockModel=_dockArray[indexPath.row];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (index!=nil) {
        YXLDockCell *cell = (YXLDockCell *)[tableView cellForRowAtIndexPath:index];
        cell.backgroundColor=[UIColor whiteColor];
    }
    if ([_delegateDock respondsToSelector:@selector(clickDockindexPathRow:  )]) {
        [_delegateDock clickDockindexPathRow:_dockArray[indexPath.row]];
    }
    
    //取消选中颜色
    YXLDockCell *cell = (YXLDockCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    index=indexPath;
}

@end
