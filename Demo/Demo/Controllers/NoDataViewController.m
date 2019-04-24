//
//  NoDataViewController.m
//  Demo
//
//  Created by Haijun on 2019/4/23.
//  Copyright © 2019 Haijun. All rights reserved.
//

#import "NoDataViewController.h"
#import "HJPlaceholderView.h"

@interface NoDataViewController ()

@end

@implementation NoDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // self.view.hj_noDataMessageText = @"暂无收藏";
    // self.view.hj_noDataImage = [UIImage imageNamed:@"none_collect"];
    [self.view hj_showNoDataView];
}

@end
