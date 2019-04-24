//
//  ViewController.m
//  Demo
//
//  Created by Haijun on 2019/4/22.
//  Copyright © 2019 Haijun. All rights reserved.
//

#import "ViewController.h"
#import "HJPlaceholderView.h"
#import "NoDataViewController.h"
#import "NoNetworkViewController.h"
#import "TableViewController.h"
#import "LoadingViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化统一样式
    [self initAppearance];
    
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.data = @[@{@"title":@"无数据默认占位视图", @"class":[NoDataViewController class]},
                  @{@"title":@"无网络占位视图", @"class":[NoNetworkViewController class]},
                  @{@"title":@"Loading占位视图", @"class":[LoadingViewController class]},
                  @{@"title":@"UITableView", @"class":[TableViewController class]}];
    
}

#pragma mark - UITableView

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class cls = self.data[indexPath.row][@"class"];
    [self.navigationController pushViewController:[cls new] animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.data[indexPath.row][@"title"];
    return cell;
}

#pragma mark - Init

- (void)initAppearance {
    [HJPlaceholderViewUtils applyDefaultResource];
    [UIView appearance].hj_noDataImage = [UIImage imageNamed:@"none_content"];
    [UIView appearance].hj_noNetworkImage = [UIImage imageNamed:@"none_network"];
    [HJNormalPlaceholderView appearance].operaButtonTitleFont = [UIFont boldSystemFontOfSize:16];
    [HJNormalPlaceholderView appearance].operaButtonBackgroundColor = [UIColor clearColor];
    [HJNormalPlaceholderView appearance].operaButtonTitleColor = [UIColor redColor];
    [HJNormalPlaceholderView appearance].operaButtonBorderWidth = 2;
    [HJNormalPlaceholderView appearance].operaButtonCornerRadius = 10;
    [HJNormalPlaceholderView appearance].operaButtonBorderColor = [UIColor redColor];
    [HJLoadingPlaceholderView appearance].progressForeColor = [UIColor blackColor];
    [HJLoadingPlaceholderView appearance].progressLineWidth = 1;
}

@end
