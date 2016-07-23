//
//  AJMyViewController.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJMyViewController.h"
#import "AJTitleIconAction.h"
#import "AJOrderHeadView.h"
#import "AJMyHeadView.h"

@interface AJMyViewController ()
@property (nonatomic, strong) NSArray *orderMens;
@property (nonatomic, strong) NSArray *mineMenus;
@property (nonatomic, strong) AJMyHeadView *mainHeadView;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end

@implementation AJMyViewController

- (NSArray *)orderMens{
    if (!_orderMens) {
        _orderMens = @[
                       [AJTitleIconAction titleIconWith:@"待支付" icon:[UIImage imageNamed:@"icon_daifukuan"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"待支付" icon:[UIImage imageNamed:@"icon_daishouhuo"] controller:nil tag:1],
                         [AJTitleIconAction titleIconWith:@"待支付" icon:[UIImage imageNamed:@"icon_daipingjia"] controller:nil tag:2],
                        [AJTitleIconAction titleIconWith:@"待支付" icon:[UIImage imageNamed:@"icon_tuikuan"] controller:nil tag:3],
                             ];
    }
    return _orderMens;
}

- (NSArray *)mineMenus{
    if (!_mineMenus) {
        _mineMenus = @[
                       [AJTitleIconAction titleIconWith:@"收货地址" icon:[UIImage imageNamed:@"v2_my_address_icon-1"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"我的店铺" icon:[UIImage imageNamed:@"icon_mystore-1"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"优惠券" icon:[UIImage imageNamed:@"icon_mycoupon"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"我的消息" icon:[UIImage imageNamed:@"icon_message"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"在线客服" icon:[UIImage imageNamed:@"v2_my_serviceonline_icon-1"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"意见反馈" icon:[UIImage imageNamed:@"v2_my_feedback_icon-1"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"分享给朋友" icon:[UIImage imageNamed:@"v2_my_share_icon-1"] controller:nil tag:0],
                       [AJTitleIconAction titleIconWith:@"帮助中心" icon:[UIImage imageNamed:@"icon_help"] controller:nil tag:0],
                       
                       ];
    }
    return _mineMenus;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self buildHeadView];
    [self buildScrollView];
}

- (void)buildHeadView{
    self.mainHeadView = [[AJMyHeadView alloc]init];
    [self.view addSubview:self.mainHeadView];
    
    [self.mainHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.and.trailing.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
}

- (void)buildScrollView{
    self.mainScrollView = [[UIScrollView alloc]init];
    self.mainScrollView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:self.mainScrollView];
    
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainHeadView.mas_bottom);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-50);
    }];
    UIView *contentView = [[UIView alloc]init];
    [self.mainScrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainScrollView);
        make.width.equalTo(self.mainScrollView);
    }];
    
    AJOrderHeadView *orderHeadView = [[AJOrderHeadView alloc]init];
    [self.mainScrollView addSubview:orderHeadView];
    [orderHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainScrollView).offset(10);
        make.leading.trailing.equalTo(self.mainScrollView);
        make.height.mas_equalTo(40);
    }];
}












- (void)loadView{
    [super loadView];
    self.navigationController.navigationBar.hidden = YES;
}

@end
