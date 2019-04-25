//
//  UITableView+HJPlaceholderView.h
//
//  Created by Haijun on 2019/4/22.
//

#import <UIKit/UIKit.h>
#import "HJTableViewPlaceholder.h"

NS_ASSUME_NONNULL_BEGIN

/**
 UITableView无数据占位视图
 注意事项：
    UITableView某个section处于显示占位视图状态，不能对该section调用insertRowsAtIndexPaths
 */
@interface UITableView (HJPlaceholderView)

/// 占位视图默认高度，默认 = 0，如果为0，将使用tableView高度
@property (nonatomic, assign) CGFloat hj_placeholderViewHeight;
/*
 是否允许显示占位视图，优先级最高，如果此属性为NO delegate会被忽略，
 注意：添加此属性的原因是TableView默认会有占位视图，有些需求可能是在加载数据之后才显示占位视图
 */
@property (nonatomic, assign) BOOL hj_isAllowShowPlaceholder;

@end

NS_ASSUME_NONNULL_END
