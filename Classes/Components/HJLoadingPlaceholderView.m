//
//  HJLoadingPlaceholderView.m
//
//  Created by Haijun on 2019/4/23.
//

#import "HJLoadingPlaceholderView.h"
#import "HJCircleProgressLayer.h"

@interface HJLoadingPlaceholderView ()

@property (nonatomic, strong, readwrite) UILabel *textLabel;
@property (nonatomic, strong) HJCircleProgressLayer *progressLayer;

@end

@implementation HJLoadingPlaceholderView

#pragma mark - Override

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.progressLayer.frame = CGRectMake((CGRectGetWidth(self.contentView.bounds) - self.progressSize) * 0.5,
                                          (CGRectGetHeight(self.contentView.bounds) - self.progressSize) * 0.5,
                                          self.progressSize, self.progressSize);
    if (_textLabel) {
        [_textLabel sizeToFit];
        _textLabel.center = CGPointMake(CGRectGetWidth(self.contentView.bounds) * 0.5, CGRectGetMaxY(self.progressLayer.frame) + 20);
    }
}

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
        [self initSubviews];
    }
    return self;
}

- (void)initialize {
    _progressSize = 40;
    _messageTextFont = [UIFont systemFontOfSize:14];
    _messageTextColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1];
}

- (void)initSubviews {
    self.progressLayer = [HJCircleProgressLayer new];
    self.progressLayer.progress = 0.4;
    self.progressLayer.lineWidth = self.progressLineWidth;
    [self.contentView.layer addSublayer:self.progressLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(M_PI * 2);
    animation.duration = 0.8;
    animation.repeatCount = CGFLOAT_MAX;
    animation.removedOnCompletion = NO;
    [self.progressLayer addAnimation:animation forKey:nil];
}

#pragma mark - Setter & Getter

- (void)setProgressSize:(CGFloat)progressSize {
    _progressSize = progressSize;
    [self setNeedsLayout];
}

- (void)setProgressForeColor:(UIColor *)progressForeColor {
    _progressForeColor = progressForeColor;
    self.progressLayer.foreColor = progressForeColor;
}

- (void)setProgressBackColor:(UIColor *)progressBackColor {
    _progressBackColor = progressBackColor;
    self.progressLayer.backColor = progressBackColor;
}

- (void)setProgressLineWidth:(CGFloat)progressLineWidth {
    _progressLineWidth = progressLineWidth;
    self.progressLayer.lineWidth = progressLineWidth;
}

- (void)setMessageTextFont:(UIFont *)messageTextFont {
    _messageTextFont = messageTextFont;
    _textLabel.font = messageTextFont;
}

- (void)setMessageTextColor:(UIColor *)messageTextColor {
    _messageTextColor = messageTextColor;
    _textLabel.textColor = messageTextColor;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = self.messageTextFont;
        _textLabel.textColor = self.messageTextColor;
        [self.contentView addSubview:_textLabel];
    }
    return _textLabel;
}

@end

