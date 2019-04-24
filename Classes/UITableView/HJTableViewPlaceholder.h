//
//  HJTableViewPlaceholder.h
//
//  Created by Haijun on 2019/4/22.
//

#import <UIKit/UIKit.h>
#import "HJBasePlaceholderView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HJTableViewPlaceholderDelegate <UITableViewDelegate>

@optional
- (BOOL)tableview:(UITableView *)tableView shouldShowDataPlaceholderViewAtSection:(NSInteger)section;
- (HJBasePlaceholderView *)tableView:(UITableView *)tableView dataPlaceholderViewAtSection:(NSInteger)section;

@end

@interface HJTableViewPlaceholder : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<HJTableViewPlaceholderDelegate> delegate;
@property (nonatomic, weak) id<UITableViewDataSource> dataSource;

@end

NS_ASSUME_NONNULL_END
