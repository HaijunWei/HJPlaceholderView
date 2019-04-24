//
//  HJNormalPlaceholderView.h
//
//  Created by Haijun on 2019/4/22.
//

#import <UIKit/UIKit.h>
#import "HJBasePlaceholderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HJNormalPlaceholderView : HJBasePlaceholderView

@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic, strong, readonly) UILabel *textLabel;
@property (nonatomic, strong, readonly) UIButton *operaButton;

/// 内部视图间距，[@(10), @(20)]
@property (nonatomic, strong) NSArray<NSNumber *> *viewSpacings UI_APPEARANCE_SELECTOR;
/// 图片缩放比例，默认 = 1
@property (nonatomic, assign) CGFloat imageScale UI_APPEARANCE_SELECTOR;

/// 操作按钮高度，默认 = 44
@property (nonatomic, assign) CGFloat operaButtonHeight UI_APPEARANCE_SELECTOR;
/// 操作按钮背景颜色，默认 = [UIColor redColor]
@property (nonatomic, strong) UIColor *operaButtonBackgroundColor UI_APPEARANCE_SELECTOR;
/// 操作按钮边框颜色，默认 = [UIColor clearColor]
@property (nonatomic, strong) UIColor *operaButtonBorderColor UI_APPEARANCE_SELECTOR;
/// 操作按钮边框大小，默认 = 0
@property (nonatomic, assign) CGFloat operaButtonBorderWidth UI_APPEARANCE_SELECTOR;
/// 操作按钮圆角大小，默认 = 3
@property (nonatomic, assign) CGFloat operaButtonCornerRadius UI_APPEARANCE_SELECTOR;
/// 操作按钮标题颜色，默认 = [UIColor whiteColor]
@property (nonatomic, strong) UIColor *operaButtonTitleColor UI_APPEARANCE_SELECTOR;
/// 操作按钮标题字体，默认 = [UIFont systemFontOfSize:16]
@property (nonatomic, strong) UIFont *operaButtonTitleFont UI_APPEARANCE_SELECTOR;

/// 消息文本颜色，默认 = RGB(153, 153, 153)
@property (nonatomic, strong) UIColor *messageTextColor UI_APPEARANCE_SELECTOR;
/// 消息文本字体，默认 = [UIFont systemFontOfSize:14]
@property (nonatomic, strong) UIFont *messageTextFont UI_APPEARANCE_SELECTOR;

/// 操作按钮点击block
@property (nonatomic, copy) void (^_Nullable operaBlock)(void);

@end

NS_ASSUME_NONNULL_END
