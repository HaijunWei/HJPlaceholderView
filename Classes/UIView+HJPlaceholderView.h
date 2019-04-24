//
//  UIView+HJPlaceholderView.h
//
//  Created by Haijun on 2019/4/22.
//

#import <UIKit/UIKit.h>
#import "HJPlaceholderAnimator.h"
#import "HJBasePlaceholderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HJPlaceholderView)

/// 无数据占位图
@property (nonatomic, strong) UIImage *_Nullable hj_noDataImage UI_APPEARANCE_SELECTOR;
/// 无数据提示文本
@property (nonatomic, copy) NSString *_Nullable hj_noDataMessageText UI_APPEARANCE_SELECTOR;
/// 占位视图显示隐藏动画
@property (nonatomic, strong) id<HJPlaceholderAnimator> _Nullable hj_dataPlaceholderAnimator UI_APPEARANCE_SELECTOR;

/// 网络错误占位图
@property (nonatomic, strong) UIImage *_Nullable hj_noNetworkImage UI_APPEARANCE_SELECTOR;
/// 网络错误提示文本
@property (nonatomic, copy) NSString *_Nullable hj_noNetworkMessageText UI_APPEARANCE_SELECTOR;
/// 网络错误操作按钮标题
@property (nonatomic, copy) NSString *_Nullable hj_noNetworkOperaTitle UI_APPEARANCE_SELECTOR;
/// 占位视图外边距，默认 = UIEdgeInsetsZero
@property (nonatomic, assign) UIEdgeInsets hj_placeholderAdjustedMargin;

/// 加载状态消息文本
@property (nonatomic, copy) NSString *_Nullable hj_loadingMessageText UI_APPEARANCE_SELECTOR;

/**
 显示无数据占位视图
 */
- (void)hj_showNoDataView;

/**
 显示加载视图
 */
- (void)hj_showLoadingView;

/**
 显示网络错误占位视图

 @param operaBlock 操作按钮回调
 */
- (void)hj_showNoNetworkView:(void(^)(void))operaBlock;

/**
 显示占位图
 
 @param image 图片
 @param messageText 消息文本
 @param operaTitle 操作按钮标题
 @param operaBlock 操作按钮回调
 */
- (void)hj_showPlaceholderView:(UIImage *)image
                   messageText:(NSString *)messageText
                    operaTitle:(NSString *)operaTitle
                    operaBlock:(void(^)(void))operaBlock;

#pragma mark - Base

- (void)hj_showDataPlaceholderView:(HJBasePlaceholderView *)view;

- (void)hj_showDataPlaceholderView:(HJBasePlaceholderView *)view animated:(BOOL)animated;

/**
 显示占位视图，所有占位视图显示都需调用此方法

 @param view 占位视图
 @param animator 动画器
 */
- (void)hj_showDataPlaceholderView:(HJBasePlaceholderView *)view animator:(id<HJPlaceholderAnimator> _Nullable)animator;

/**
 销毁占位视图
 */
- (void)hj_hideDataPlaceholderView;

@end

NS_ASSUME_NONNULL_END
