//
//  UIView+HJPlaceholderView.m
//
//  Created by Haijun on 2019/4/22.
//

#import "UIView+HJPlaceholderView.h"
#import "HJNormalPlaceholderView.h"
#import "HJLoadingPlaceholderView.h"
#import <objc/runtime.h>

@implementation UIView (HJPlaceholderView)

- (void)hj_showNoDataView {
    HJNormalPlaceholderView *placeholderView = [HJNormalPlaceholderView new];
    placeholderView.imageView.image = self.hj_noDataImage ? : [UIView appearance].hj_noDataImage;
    placeholderView.textLabel.text = self.hj_noDataMessageText ? : [UIView appearance].hj_noDataMessageText;
    [self hj_showDataPlaceholderView:placeholderView animated:YES];
}

- (void)hj_showLoadingView {
    HJLoadingPlaceholderView *placeholderView = [HJLoadingPlaceholderView new];
    placeholderView.textLabel.text = self.hj_loadingMessageText ? : [UIView appearance].hj_loadingMessageText;
    [self hj_showDataPlaceholderView:placeholderView animated:YES];
}

- (void)hj_showNoNetworkView:(void (^)(void))operaBlock {
    HJNormalPlaceholderView *placeholderView = [HJNormalPlaceholderView new];
    placeholderView.imageView.image = self.hj_noNetworkImage ? : [UIView appearance].hj_noNetworkImage;
    placeholderView.textLabel.text = self.hj_noNetworkMessageText ? : [UIView appearance].hj_noNetworkMessageText;
    [placeholderView.operaButton setTitle:self.hj_noNetworkOperaTitle ? : [UIView appearance].hj_noNetworkOperaTitle forState:UIControlStateNormal];
    placeholderView.operaBlock = operaBlock;
    [self hj_showDataPlaceholderView:placeholderView animated:YES];
}

- (void)hj_showPlaceholderView:(UIImage *)image messageText:(NSString *)messageText operaTitle:(NSString *)operaTitle operaBlock:(void (^)(void))operaBlock {
    HJNormalPlaceholderView *placeholderView = [HJNormalPlaceholderView new];
    placeholderView.imageView.image = image;
    placeholderView.textLabel.text = messageText;
    placeholderView.operaBlock = operaBlock;
    [placeholderView.operaButton setTitle:operaTitle forState:UIControlStateNormal];
    [self hj_showDataPlaceholderView:placeholderView animated:YES];
}

#pragma mark - Base

- (void)hj_showDataPlaceholderView:(HJBasePlaceholderView *)view {
    [self hj_showDataPlaceholderView:view animated:YES];
}

- (void)hj_showDataPlaceholderView:(HJBasePlaceholderView *)view animated:(BOOL)animated {
    [self hj_showDataPlaceholderView:view animator:animated ? (self.hj_dataPlaceholderAnimator ? : [UIView appearance].hj_dataPlaceholderAnimator) : nil];
}

- (void)hj_showDataPlaceholderView:(HJBasePlaceholderView *)view animator:(id<HJPlaceholderAnimator>)animator {
    if (self.hj_dataPlaceholderView) { return; }
    self.hj_dataPlaceholderView = view;
    [self addSubview:self.hj_dataPlaceholderView];
    CGRect frame = self.bounds;
    UIEdgeInsets margin = self.hj_placeholderAdjustedMargin;
    frame.origin.x = margin.left;
    frame.origin.y = margin.top;
    frame.size.width -= margin.left + margin.right;
    frame.size.height -= margin.top + margin.bottom;
    self.hj_dataPlaceholderView.frame = frame;
    self.hj_dataPlaceholderView.backgroundColor = self.backgroundColor;
    self.hj_dataPlaceholderView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.hj_currentDataPlaceholderAnimator = animator;
    if (animator) {
        [animator dataPlaceholderWillShow:view completion:^{}];
    }
}

- (void)hj_hideDataPlaceholderView {
    HJBasePlaceholderView *placeholderView = self.hj_dataPlaceholderView;
    id<HJPlaceholderAnimator> animator = self.hj_currentDataPlaceholderAnimator;
    self.hj_dataPlaceholderView = nil;
    self.hj_currentDataPlaceholderAnimator = nil;
    if (animator) {
        [animator dataPlaceholderWillHide:placeholderView completion:^{
            [placeholderView removeFromSuperview];
        }];
    } else {
        [placeholderView removeFromSuperview];
    }
}

#pragma mark - Getter & Setter

static char kDataPlaceholderView;
static char kNoDataImage;
static char kNoDataMessageText;
static char kNoNetworkImage;
static char kNoNetworkMessageText;
static char kNoNetworkOperaTitle;
static char kDataPlaceholderAnimator;
static char kCurrentDataPlaceholderAnimator;
static char kPlaceholderAdjustedMargin;
static char kLoadingMessageText;


- (void)setHj_dataPlaceholderView:(HJBasePlaceholderView *)hj_dataPlaceholderView {
    objc_setAssociatedObject(self, &kDataPlaceholderView, hj_dataPlaceholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HJBasePlaceholderView *)hj_dataPlaceholderView {
    return objc_getAssociatedObject(self, &kDataPlaceholderView);
}

- (void)setHj_dataPlaceholderAnimator:(id<HJPlaceholderAnimator>)hj_dataPlaceholderAnimator {
    objc_setAssociatedObject(self, &kDataPlaceholderAnimator, hj_dataPlaceholderAnimator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<HJPlaceholderAnimator>)hj_dataPlaceholderAnimator {
    return objc_getAssociatedObject(self, &kDataPlaceholderAnimator);
}

- (void)setHj_noDataImage:(UIImage *)hj_noDataImage {
    objc_setAssociatedObject(self, &kNoDataImage, hj_noDataImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)hj_noDataImage {
    return objc_getAssociatedObject(self, &kNoDataImage);
}

- (void)setHj_noDataMessageText:(NSString *)hj_noDataMessageText {
    objc_setAssociatedObject(self, &kNoDataMessageText, hj_noDataMessageText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)hj_noDataMessageText {
    return objc_getAssociatedObject(self, &kNoDataMessageText);
}

- (void)setHj_noNetworkImage:(UIImage *)hj_noNetworkImage {
    objc_setAssociatedObject(self, &kNoNetworkImage, hj_noNetworkImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)hj_noNetworkImage {
    return objc_getAssociatedObject(self, &kNoNetworkImage);
}

- (void)setHj_noNetworkMessageText:(NSString *)hj_noNetworkMessageText {
    objc_setAssociatedObject(self, &kNoNetworkMessageText, hj_noNetworkMessageText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)hj_noNetworkMessageText {
    return objc_getAssociatedObject(self, &kNoNetworkMessageText);
}

- (void)setHj_noNetworkOperaTitle:(NSString *)hj_noNetworkOperaTitle {
    objc_setAssociatedObject(self, &kNoNetworkOperaTitle, hj_noNetworkOperaTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)hj_noNetworkOperaTitle {
    return objc_getAssociatedObject(self, &kNoNetworkOperaTitle);
}

- (void)setHj_currentDataPlaceholderAnimator:(id<HJPlaceholderAnimator>)hj_currentDataPlaceholderAnimator {
    objc_setAssociatedObject(self, &kCurrentDataPlaceholderAnimator, hj_currentDataPlaceholderAnimator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<HJPlaceholderAnimator>)hj_currentDataPlaceholderAnimator {
    return objc_getAssociatedObject(self, &kCurrentDataPlaceholderAnimator);
}

- (void)setHj_placeholderAdjustedMargin:(UIEdgeInsets)hj_placeholderAdjustedMargin {
    objc_setAssociatedObject(self, &kPlaceholderAdjustedMargin, [NSValue valueWithUIEdgeInsets:hj_placeholderAdjustedMargin], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)hj_placeholderAdjustedMargin {
    NSValue *marginValue = objc_getAssociatedObject(self, &kPlaceholderAdjustedMargin);
    return marginValue ? [marginValue UIEdgeInsetsValue] : UIEdgeInsetsZero;
}

- (void)setHj_loadingMessageText:(NSString *)hj_loadingMessageText {
    objc_setAssociatedObject(self, &kLoadingMessageText, hj_loadingMessageText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)hj_loadingMessageText {
    return objc_getAssociatedObject(self, &kLoadingMessageText);
}

@end
