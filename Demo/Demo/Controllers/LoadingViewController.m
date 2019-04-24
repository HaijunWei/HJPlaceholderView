//
//  LoadingViewController.m
//  Demo
//
//  Created by Haijun on 2019/4/23.
//  Copyright © 2019 Haijun. All rights reserved.
//

#import "LoadingViewController.h"
#import "HJPlaceholderView.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view hj_showLoadingView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view hj_hideDataPlaceholderView];
        [self.view hj_showNoDataView];
    });
}

@end
