//
//  TableViewController.m
//  Demo
//
//  Created by Haijun on 2019/4/23.
//  Copyright © 2019 Haijun. All rights reserved.
//

#import "TableViewController.h"
#import "HJPlaceholderView.h"

@interface TableViewController () <UITableViewDataSource, HJTableViewPlaceholderDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [NSMutableArray new];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setEditing:YES animated:YES];
    [self.view addSubview:self.tableView];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.frame = CGRectMake(15, 300, 100, 35);
    [addButton setTitle:@"添加数据" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    removeButton.frame = CGRectMake(15, 350, 100, 35);
    [removeButton setTitle:@"移除数据" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(removeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeButton];
}

#pragma mark - Actions

- (void)addClick {
    self.tableView.hj_isAllowShowPlaceholder = YES;
    [self.dataArray addObject:@"1"];
    [self.tableView reloadData];
}

- (void)removeClick {
    [self.dataArray removeLastObject];
    [self.tableView reloadData];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) { return 0; }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataArray removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

//- (BOOL)tableview:(UITableView *)tableView shouldShowDataPlaceholderViewAtSection:(NSInteger)section {
//    return YES;
//}
//
//- (HJBasePlaceholderView *)tableView:(UITableView *)tableView dataPlaceholderViewAtSection:(NSInteger)section {
//    HJNormalPlaceholderView *view = [HJNormalPlaceholderView new];
//    view.frame = CGRectMake(0, 0, 0, 300);
//    if (section == 0) {
//        view.imageView.image = [UIView appearance].hj_noDataImage;
//        view.textLabel.text = [UIView appearance].hj_noDataMessageText;
//    } else {
//        view.imageView.image = [UIImage imageNamed:@"none_network"];
//        view.textLabel.text = @"网络中断";
//        [view.operaButton setTitle:@"重新加载" forState:UIControlStateNormal];
//        view.operaBlock = ^{
//            NSLog(@"%s", __func__);
//        };
//    }
//    return view;
//}

@end
