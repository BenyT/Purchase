//
//  YXLPurchaseVC.m
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import "YXLPurchaseVC.h"
#import "YXLDockTableView.h"
#import "YXLRightTableView.h"
#import "YXLDockModel.h"
#import "YXLDockCell.h"
#import "MJExtension.h"
@interface YXLPurchaseVC ()<dockTavleViewDelegate>
{
    YXLDockTableView *dockTable;
    YXLRightTableView *rightTable;
    NSMutableArray *dataArray;
}
@end

@implementation YXLPurchaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;
    
    
    dockTable = [self getDockTable];
    dockTable.delegateDock=self;
    [self.view addSubview:dockTable];
    [dockTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(75, CGHeight(self.view.frame)));
    }];
    
    rightTable = [self getRightTable];
    [self.view addSubview:rightTable];
    [rightTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(dockTable.mas_right);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth-75, CGHeight(self.view.frame)));

    }];
    
    
    [self initData];
    
    
    // Do any additional setup after loading the view.
}



#pragma  -make 手写数据  请忽视
-(void)initData{
    
    dataArray=[NSMutableArray array];
    for (int i =0;i < 3;i++) {
        if (i==0) {
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            NSMutableArray *array =[NSMutableArray array];
            for (int q=0; q<7; q++) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"ID":[NSString stringWithFormat:@"%d",q],@"commodityName":[NSString stringWithFormat:@"啤酒%d",q],@"commodityImageURL":@"",@"commodityPrice":@23,@"commodityDiscountedPrices":@13,@"commodityDiscountedQuantity":@0} mutableCopy];
                    [array addObject:dic1];
            }
            dic =[@{@"commodityDockName":@"啤酒",@"commodityArray":array} mutableCopy];
            [dataArray addObject:dic];
        }else if (i==1){
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            NSMutableArray *array =[NSMutableArray array];
            for (int q=0; q<7; q++) {
                NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                dic1=[@{@"ID":[NSString stringWithFormat:@"%d",q],@"commodityName":[NSString stringWithFormat:@"衣服%d",q],@"commodityImageURL":@"",@"commodityPrice":@23,@"commodityDiscountedPrices":@13,@"commodityDiscountedQuantity":@0} mutableCopy];
                [array addObject:dic1];
            }
            dic =[@{@"commodityDockName":@"衣服",@"commodityArray":array} mutableCopy];
            [dataArray addObject:dic];
        }else if (i==2){
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            NSMutableArray *array =[NSMutableArray array];
            for (int q=0; q<7; q++) {
                NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                dic1=[@{@"ID":[NSString stringWithFormat:@"%d",q],@"commodityName":[NSString stringWithFormat:@"大白褂%d",q],@"commodityImageURL":@"",@"commodityPrice":@23,@"commodityDiscountedPrices":@13,@"commodityDiscountedQuantity":@0} mutableCopy];
                [array addObject:dic1];
            }
            dic =[@{@"commodityDockName":@"大白褂",@"commodityArray":array} mutableCopy];
            [dataArray addObject:dic];
        }
    }
    
    dockTable.dockArray=[YXLDockModel objectArrayWithKeyValuesArray:dataArray];
    [dockTable reloadData];
    
    YXLDockModel *model =dockTable.dockArray[0];
    rightTable.rightArray=model.commodityArray;
    [rightTable reloadData];
}

#pragma  -make 代理
-(void)clickDockindexPathRow:(YXLDockModel *)dockModel{
    rightTable.rightArray=dockModel.commodityArray;
    [rightTable reloadData];
}


#pragma  -make 初始化
-(YXLDockTableView *)getDockTable{
    YXLDockTableView *table =[YXLDockTableView new];
    table.backgroundColor=[UIColor lightGrayColor];
    table.tableFooterView=[[UIView alloc]init];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    return table;
}

-(YXLRightTableView *)getRightTable{
    YXLRightTableView *table =[YXLRightTableView new];
    table.backgroundColor=[UIColor redColor];
    table.tableFooterView=[[UIView alloc]init];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    return table;
}
@end
