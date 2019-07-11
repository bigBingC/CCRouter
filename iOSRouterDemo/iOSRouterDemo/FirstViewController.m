//
//  FirstViewController.m
//  iOSRouterDemo
//
//  Created by 崔冰smile on 2019/7/10.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "FirstViewController.h"
#import "Masonry.h"

@interface FirstViewController ()
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UILabel *lblTips;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createBaseView];
}

- (void)createBaseView {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.lblTitle];
    [self.view addSubview:self.lblTips];
    
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.left.equalTo(self.view.mas_left).offset(20);
    }];
    
    [self.lblTips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(300);
        make.left.equalTo(self.view.mas_left).offset(20);
    }];
    
    self.lblTitle.text = self.strTitle;
    self.lblTips.text = self.strTips;
}

- (UILabel *)lblTitle {
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] init];
    }
    return _lblTitle;
}

- (UILabel *)lblTips {
    if (!_lblTips) {
        _lblTips = [[UILabel alloc] init];
    }
    return _lblTips;
}


@end
