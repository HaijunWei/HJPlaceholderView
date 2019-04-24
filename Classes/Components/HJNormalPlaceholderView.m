//
//  HJNormalPlaceholderView.m
//
//  Created by Haijun on 2019/4/22.
//

#import "HJNormalPlaceholderView.h"

@interface HJNormalPlaceholderView ()

@property (nonatomic, strong, readwrite) UIImageView *imageView;
@property (nonatomic, strong, readwrite) UILabel *textLabel;
@property (nonatomic, strong, readwrite) UIButton *operaButton;

@end

@implementation HJNormalPlaceholderView

#pragma mark - Actions

- (void)operaClick {
    if (self.operaBlock) { self.operaBlock(); }
}

#pragma mark - Override

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat startY = (CGRectGetHeight(self.contentView.bounds) - [self calculateContentHeight]) * 0.5;
    if (_imageView) {
        CGRect frame = _imageView.frame;
        frame.origin.y = startY;
        frame.origin.x = (CGRectGetWidth(self.contentView.bounds) - CGRectGetWidth(_imageView.bounds)) * 0.5;
        _imageView.frame = frame;
    }
    if (_textLabel) {
        CGRect frame = _textLabel.frame;
        frame.origin.x = (CGRectGetWidth(self.contentView.bounds) - CGRectGetWidth(_textLabel.bounds)) * 0.5;
        frame.origin.y = _imageView ? CGRectGetMaxY(_imageView.frame) + self.viewSpacings[0].floatValue : startY;
        _textLabel.frame = frame;
    }
    if (_operaButton) {
        UIView *preView = _textLabel ? : _imageView;
        CGRect frame = _operaButton.frame;
        frame.size.width += 30;
        frame.origin.x = (CGRectGetWidth(self.contentView.bounds) - CGRectGetWidth(frame)) * 0.5;
        frame.origin.y = preView ? CGRectGetMaxY(preView.frame) + self.viewSpacings[1].floatValue : startY;
        frame.size.height = self.operaButtonHeight;
        _operaButton.frame = frame;
    }
}


#pragma mark - Helpers

- (CGFloat)calculateContentHeight {
    CGFloat height = 0;
    if (_imageView) {
        [_imageView sizeToFit];
        CGRect frame = _imageView.frame;
        frame.size.width *= self.imageScale;
        frame.size.height *= self.imageScale;
        _imageView.frame = frame;
        height += CGRectGetHeight(frame);
        height += self.viewSpacings[0].floatValue;
    }
    if (_textLabel) {
        _textLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), 100);
        [_textLabel sizeToFit];
        height += CGRectGetHeight(_textLabel.bounds);
        height += self.viewSpacings[1].floatValue;
    }
    if (_operaButton) {
        [_operaButton sizeToFit];
        height += 44;
    }
    return height;
}

#pragma mark - Init

- (void)initialize {
    _viewSpacings = @[@(10), @(20)];
    _imageScale = 1;
    
    _operaButtonHeight = 35;
    _operaButtonTitleFont = [UIFont systemFontOfSize:16];
    _operaButtonTitleColor = [UIColor whiteColor];
    _operaButtonBackgroundColor = [UIColor redColor];
    _operaButtonBorderColor = [UIColor clearColor];
    _operaButtonBorderWidth = 0;
    _operaButtonCornerRadius = 3;
    
    _messageTextFont = [UIFont systemFontOfSize:14];
    _messageTextColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

#pragma mark - Getter & Setter

- (void)setViewSpacings:(NSArray<NSNumber *> *)viewSpacings {
    _viewSpacings = viewSpacings;
    [self setNeedsLayout];
}

- (void)setImageScale:(CGFloat)imageScale {
    _imageScale = imageScale;
    [self setNeedsLayout];
}

- (void)setOperaButtonHeight:(CGFloat)operaButtonHeight {
    _operaButtonHeight = operaButtonHeight;
    [self setNeedsLayout];
}

- (void)setOperaButtonTitleFont:(UIFont *)operaButtonTitleFont {
    _operaButtonTitleFont = operaButtonTitleFont;
    _operaButton.titleLabel.font = operaButtonTitleFont;
}

- (void)setOperaButtonTitleColor:(UIColor *)operaButtonTitleColor {
    _operaButtonTitleColor = operaButtonTitleColor;
    [_operaButton setTitleColor:operaButtonTitleColor forState:UIControlStateNormal];
}

- (void)setOperaButtonBackgroundColor:(UIColor *)operaButtonBackgroundColor {
    _operaButtonBackgroundColor = operaButtonBackgroundColor;
    _operaButton.backgroundColor = operaButtonBackgroundColor;
}

- (void)setOperaButtonBorderColor:(UIColor *)operaButtonBorderColor {
    _operaButtonBorderColor = operaButtonBorderColor;
    _operaButton.layer.borderColor = operaButtonBorderColor.CGColor;
}

- (void)setOperaButtonBorderWidth:(CGFloat)operaButtonBorderWidth {
    _operaButtonBorderWidth = operaButtonBorderWidth;
    _operaButton.layer.borderWidth = operaButtonBorderWidth;
}

- (void)setOperaButtonCornerRadius:(CGFloat)operaButtonCornerRadius {
    _operaButtonCornerRadius = operaButtonCornerRadius;
    _operaButton.layer.cornerRadius = operaButtonCornerRadius;
}

- (void)setMessageTextFont:(UIFont *)messageTextFont {
    _messageTextFont = messageTextFont;
    _textLabel.font = messageTextFont;
}

- (void)setMessageTextColor:(UIColor *)messageTextColor {
    _messageTextColor = messageTextColor;
    _textLabel.textColor = messageTextColor;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = self.messageTextFont;
        _textLabel.textColor = self.messageTextColor;
        _textLabel.numberOfLines = 0;
        [self.contentView addSubview:_textLabel];
    }
    return _textLabel;
}

- (UIButton *)operaButton {
    if (!_operaButton) {
        _operaButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _operaButton.titleLabel.font = self.operaButtonTitleFont;
        _operaButton.backgroundColor = self.operaButtonBackgroundColor;
        _operaButton.clipsToBounds = YES;
        _operaButton.layer.borderWidth = self.operaButtonBorderWidth;
        _operaButton.layer.cornerRadius = self.operaButtonCornerRadius;
        _operaButton.layer.borderColor = self.operaButtonBorderColor.CGColor;
        [_operaButton setTitleColor:self.operaButtonTitleColor forState:UIControlStateNormal];
        [_operaButton addTarget:self action:@selector(operaClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_operaButton];
    }
    return _operaButton;
}

@end
