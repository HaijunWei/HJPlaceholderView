//
//  NoNetworkViewController.m
//  Demo
//
//  Created by Haijun on 2019/4/23.
//  Copyright © 2019 Haijun. All rights reserved.
//

#import "NoNetworkViewController.h"
#import "HJPlaceholderView.h"

@interface NoNetworkViewController ()

@end

@implementation NoNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view hj_showPlaceholderView:[UIImage imageNamed:@"none_network"] messageText:@"您的网络状态不太好..." operaTitle:@"重新加载" operaBlock:^{
//        NSLog(@"%s", __func__);
//    }];
    [self.view hj_showNoNetworkView:^{
        NSLog(@"%s", __func__);
    }];
}

@end
