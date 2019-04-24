//
//  HJLoadingPlaceholderView.h
//
//  Created by Haijun on 2019/4/23.
//

#import "HJBasePlaceholderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HJLoadingPlaceholderView : HJBasePlaceholderView

@property (nonatomic, strong, readonly) UILabel *textLabel;

/// 进度视图大小，默认 = 40
@property (nonatomic, assign) CGFloat progressSize UI_APPEARANCE_SELECTOR;
/// 进度条颜色
@property (nonatomic, strong) UIColor *progressForeColor UI_APPEARANCE_SELECTOR;
/// 进度条背景色
@property (nonatomic, strong) UIColor *progressBackColor UI_APPEARANCE_SELECTOR;
/// 进度条线条宽度
@property (nonatomic, assign) CGFloat progressLineWidth UI_APPEARANCE_SELECTOR;
/// 消息文本字体
@property (nonatomic, strong) UIFont *messageTextFont UI_APPEARANCE_SELECTOR;
/// 消息文本颜色
@property (nonatomic, strong) UIColor *messageTextColor UI_APPEARANCE_SELECTOR;

@end

NS_ASSUME_NONNULL_END
