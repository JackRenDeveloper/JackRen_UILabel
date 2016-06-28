//
//  ViewController.m
//  JackRen_UILabel
//
//  Created by JackRen on 16/6/28.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "ViewController.h"
#define HomePageDefineWidth [UIScreen mainScreen].bounds.size.width / 320

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.DefineLabel];
    [self.view addSubview:self.DefineSecondLabel];
}

- (JackRenDefineWordSpace *)DefineLabel {
    if (!_DefineLabel) {
        self.DefineLabel = [[JackRenDefineWordSpace alloc] initWithString:@"我的手机号码" defineFont:15*HomePageDefineWidth WithFrame:CGRectMake(15, 64 + 10*HomePageDefineWidth, 90*HomePageDefineWidth, 45*HomePageDefineWidth)];
        _DefineLabel.layer.borderWidth = 1.0;
        _DefineLabel.layer.borderColor = [[UIColor redColor] CGColor];
    }
    return _DefineLabel;
}

- (JackRenDefineWordSpace *)DefineSecondLabel {
    if (!_DefineSecondLabel) {
        self.DefineSecondLabel = [[JackRenDefineWordSpace alloc] initWithString:@"号码" defineFont:15*HomePageDefineWidth WithFrame:CGRectMake(15, 64 + 65*HomePageDefineWidth, 90*HomePageDefineWidth, 45*HomePageDefineWidth)];
        _DefineSecondLabel.layer.borderWidth = 1.0;
        _DefineSecondLabel.layer.borderColor = [[UIColor redColor] CGColor];
    }
    return _DefineSecondLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
