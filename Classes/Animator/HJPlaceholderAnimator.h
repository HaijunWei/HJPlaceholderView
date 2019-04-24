//
//  HJPlaceholderAnimator.h
//
//  Created by Haijun on 2019/4/22.
//

#import "HJBasePlaceholderView.h"

@protocol HJPlaceholderAnimator <NSObject>

/// 将要显示占位视图
- (void)dataPlaceholderWillShow:(HJBasePlaceholderView *)placeholderView completion:(void(^)(void))completion;
/// 将要隐藏占位视图
- (void)dataPlaceholderWillHide:(HJBasePlaceholderView *)placeholderView completion:(void(^)(void))completion;

@end
