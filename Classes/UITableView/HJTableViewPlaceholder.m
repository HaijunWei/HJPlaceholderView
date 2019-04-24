//
//  HJTableViewPlaceholder.m
//
//  Created by Haijun on 2019/4/22.
//

#import "HJTableViewPlaceholder.h"
#import "HJNormalPlaceholderView.h"
#import "UIView+HJPlaceholderView.h"

@interface HJTableViewPlaceholder ()

@property (nonatomic, strong) NSMutableArray<NSNumber *> *shouldShowPlaceholderMarks;
@property (nonatomic, strong) NSMutableDictionary *placeholderHeights;
@property (nonatomic, weak) id<HJTableViewPlaceholderDelegate> placeholderDelegate;

@end

@implementation HJTableViewPlaceholder

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    CGFloat number = 1;
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        number = [self.dataSource numberOfSectionsInTableView:tableView];
    }
    [self.placeholderHeights removeAllObjects];
    [self.shouldShowPlaceholderMarks removeAllObjects];
    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number = [self.dataSource tableView:tableView numberOfRowsInSection:section];
    if (number == 0 && self.placeholderDelegate != nil) {
        BOOL isShow = NO;
        if ([self.placeholderDelegate respondsToSelector:@selector(tableview:shouldShowDataPlaceholderViewAtSection:)]) {
            isShow = [self.placeholderDelegate tableview:tableView shouldShowDataPlaceholderViewAtSection:section];
        } else {
            isShow = [self tableview:tableView shouldShowDataPlaceholderViewAtSection:section];
        }
        if (isShow) {
            [self.shouldShowPlaceholderMarks addObject:@(section)];
            return 1;
        }
    }
    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && [self.shouldShowPlaceholderMarks containsObject:@(indexPath.section)]) {
        HJBasePlaceholderView *placeholderView;
        if ([self.placeholderDelegate respondsToSelector:@selector(tableView:dataPlaceholderViewAtSection:)]) {
            placeholderView = [self.placeholderDelegate tableView:tableView dataPlaceholderViewAtSection:indexPath.section];
        } else {
            placeholderView = [self tableView:tableView dataPlaceholderViewAtSection:indexPath.section];
        }
        [self.placeholderHeights setObject:@(CGRectGetHeight(placeholderView.bounds)) forKey:@(indexPath.section)];
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView hj_showDataPlaceholderView:placeholderView animated:NO];
        return cell;
    }
    return [self.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && [self.shouldShowPlaceholderMarks containsObject:@(indexPath.section)]) {
        return [self.placeholderHeights[@(indexPath.section)] floatValue];
    }
    if ([self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.delegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return tableView.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && [self.shouldShowPlaceholderMarks containsObject:@(indexPath.section)]) { return; }
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && [self.shouldShowPlaceholderMarks containsObject:@(indexPath.section)]) { return NO; }
    if ([self.dataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)]) {
        return [self.dataSource tableView:tableView canEditRowAtIndexPath:indexPath];
    }
    return NO;
}

#pragma mark - HJTableViewPlaceholderDelegate

- (BOOL)tableview:(UITableView *)tableView shouldShowDataPlaceholderViewAtSection:(NSInteger)section {
    return YES;
}

- (HJBasePlaceholderView *)tableView:(UITableView *)tableView dataPlaceholderViewAtSection:(NSInteger)section {
    HJNormalPlaceholderView *view = [HJNormalPlaceholderView new];
    view.frame = CGRectMake(0, 0, 0, 300);
    view.imageView.image = tableView.hj_noDataImage;
    view.textLabel.text = tableView.hj_noDataMessageText;
    return view;
}

#pragma mark - Message forward

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) { return YES; }
    if ([self.dataSource respondsToSelector:aSelector]) { return YES; }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) { return self.delegate; }
    if ([self.dataSource respondsToSelector:aSelector]) { return self.dataSource; }
    return nil;
}

#pragma mark - Setter

- (void)setDelegate:(id<HJTableViewPlaceholderDelegate>)delegate {
    _delegate = delegate;
    if ([delegate conformsToProtocol:@protocol(HJTableViewPlaceholderDelegate)]) {
        self.placeholderDelegate = delegate;
    } else {
        self.placeholderDelegate = nil;
    }
}

#pragma mark - Init

- (instancetype)init {
    if (self = [super init]) {
        _shouldShowPlaceholderMarks = [NSMutableArray new];
        _placeholderHeights = [NSMutableDictionary new];
    }
    return self;
}

@end

