//
//  HJBasePlaceholderView.m
//
//  Created by Haijun on 2019/4/22.
//

#import "HJBasePlaceholderView.h"

@interface HJBasePlaceholderView ()

@property (nonatomic, strong, readwrite) UIView *contentView;

@end

@implementation HJBasePlaceholderView

#pragma mark - Override

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = CGRectMake(self.contentInset.left, self.contentInset.top,
                                        CGRectGetWidth(self.bounds) - self.contentInset.left - self.contentInset.right,
                                        CGRectGetHeight(self.bounds) - self.contentInset.top - self.contentInset.bottom);
}

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _contentInset = UIEdgeInsetsMake(0, 15, 0, 15);
    }
    return self;
}

#pragma mark - Getter

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        [self addSubview:_contentView];
    }
    return _contentView;
}

@end
