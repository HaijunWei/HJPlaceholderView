//
//  HJPlaceholderFadeAnimator.m
//
//  Created by Haijun on 2019/4/22.
//

#import "HJPlaceholderFadeAnimator.h"

@implementation HJPlaceholderFadeAnimator

- (void)dataPlaceholderWillShow:(HJBasePlaceholderView *)placeholderView completion:(void (^)(void))completion {
    placeholderView.contentView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        placeholderView.contentView.alpha = 1;
    } completion:^(BOOL finished) {
        completion();
    }];
}

- (void)dataPlaceholderWillHide:(HJBasePlaceholderView *)placeholderView completion:(void (^)(void))completion {
    [UIView animateWithDuration:0.5 animations:^{
        placeholderView.alpha = 0;
    } completion:^(BOOL finished) {
        completion();
    }];
}

@end
