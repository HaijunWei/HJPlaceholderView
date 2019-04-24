//
//  HJCircleProgressLayer.m
//
//  Created by Haijun on 2019/4/23.
//

#import "HJCircleProgressLayer.h"

@interface HJCircleProgressLayer ()

@property (nonatomic, strong) CAShapeLayer *backLayer;
@property (nonatomic, strong) CAShapeLayer *foreLayer;

@end

@implementation HJCircleProgressLayer

#pragma mark - Override

- (void)layoutSublayers {
    [super layoutSublayers];
    CGPoint center = CGPointMake(CGRectGetWidth(self.bounds) * 0.5, CGRectGetHeight(self.bounds) * 0.5);
    CGFloat min = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:(min - self.lineWidth) * 0.5 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    self.backLayer.path = path.CGPath;
    self.foreLayer.path = path.CGPath;
    
    self.backLayer.frame = self.bounds;
    self.foreLayer.frame = self.bounds;
}

#pragma mark - Init

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
        [self initSublayers];
    }
    return self;
}

- (void)initialize {
    _lineWidth = 3;
    _backColor = [UIColor colorWithWhite:0 alpha:0.1];
    _foreColor = [UIColor redColor];
    _progress = 0.5;
}

- (void)initSublayers {
    _backLayer = [CAShapeLayer new];
    _backLayer.fillColor = [UIColor clearColor].CGColor;
    _backLayer.strokeColor = self.backColor.CGColor;
    _backLayer.lineWidth = self.lineWidth;
    _backLayer.lineCap = kCALineCapRound;
    [self addSublayer:_backLayer];
    
    _foreLayer = [CAShapeLayer new];
    _foreLayer.fillColor = [UIColor clearColor].CGColor;
    _foreLayer.strokeColor = self.foreColor.CGColor;
    _foreLayer.lineWidth = self.lineWidth;
    _foreLayer.lineCap = kCALineCapRound;
    _foreLayer.strokeEnd = self.progress;
    [self addSublayer:_foreLayer];
}

#pragma mark - Setter

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self setNeedsLayout];
}

- (void)setBackColor:(UIColor *)backColor {
    _backColor = backColor;
    self.backLayer.strokeColor = backColor.CGColor;
    [self setNeedsLayout];
}

- (void)setForeColor:(UIColor *)foreColor {
    _foreColor = foreColor;
    self.foreLayer.strokeColor = foreColor.CGColor;
    [self setNeedsLayout];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.foreLayer.strokeEnd = progress;
}


@end
