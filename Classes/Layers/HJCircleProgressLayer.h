//
//  HJCircleProgressLayer.h
//
//  Created by Haijun on 2019/4/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJCircleProgressLayer : CALayer

/// 线条宽度，默认 = 3
@property (nonatomic, assign) CGFloat lineWidth;
/// 进度背景色
@property (nonatomic, strong) UIColor *backColor;
/// 进度颜色
@property (nonatomic, strong) UIColor *foreColor;
/// 进度 0 - 1，默认 = 0.5
@property (nonatomic, assign) CGFloat progress;

@end

NS_ASSUME_NONNULL_END
