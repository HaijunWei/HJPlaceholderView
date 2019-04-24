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

@end

NS_ASSUME_NONNULL_END
