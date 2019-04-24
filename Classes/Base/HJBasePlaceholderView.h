//
//  HJBasePlaceholderView.h
//
//  Created by Haijun on 2019/4/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJBasePlaceholderView : UIView

@property (nonatomic, strong, readonly) UIView *contentView;

/// 内容内边距，UIEdgeInsetsMake(0, 15, 0, 15)
@property (nonatomic, assign) UIEdgeInsets contentInset;

@end

NS_ASSUME_NONNULL_END
