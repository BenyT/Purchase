//
//  ViewController.m
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#import "ViewController.h"
#import "YXLPurchaseVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn =[UIButton new];
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"屠龙宝刀，点击就送" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth, 100));
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)clickBtn{
    YXLPurchaseVC *vc =[YXLPurchaseVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
