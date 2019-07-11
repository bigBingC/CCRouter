//
//  ViewController.m
//  iOSRouterDemo
//
//  Created by 崔冰smile on 2019/7/10.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CCRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBaseView];
}

- (void)createBaseView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnFirst = ({
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"router带参" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(didPressedFirstButton) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    UIButton *btnSecond = ({
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"router字典带参" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(didPressedSecondButton) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    [self.view addSubview:btnFirst];
    [self.view addSubview:btnSecond];
    
    [btnFirst mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(100);
    }];
    
    [btnSecond mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(150);
    }];
    
}

- (void)didPressedFirstButton {
    [[CCRouter sharedInstance] handleRoute:@"ios://firstpage?title=url带参&tips=这是第二个参数"];
}

- (void)didPressedSecondButton {
    NSDictionary *dict = @{
                           @"title":@"参数传递",
                           @"tips":@"这是第二个参数"
                           };
    [[CCRouter sharedInstance] handleRoute:@"ios://secondpage" parameter:dict];
}

@end
