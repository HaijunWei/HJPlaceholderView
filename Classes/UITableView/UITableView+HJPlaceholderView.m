//
//  UITableView+HJPlaceholderView.m
//
//  Created by Haijun on 2019/4/22.
//

#import "UITableView+HJPlaceholderView.h"
#import <objc/runtime.h>

@implementation UITableView (HJPlaceholderView)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *selectorNames = @[NSStringFromSelector(@selector(setDelegate:)),
                                   NSStringFromSelector(@selector(setDataSource:))];
        [selectorNames enumerateObjectsUsingBlock:^(NSString *selectorName, NSUInteger idx, BOOL *stop) {
            Method method1 = class_getInstanceMethod(self, NSSelectorFromString(selectorName));
            NSString *newSelectorName = [NSString stringWithFormat:@"hj_%@", selectorName];
            Method method2 = class_getInstanceMethod(self, NSSelectorFromString(newSelectorName));
            method_exchangeImplementations(method1, method2);
        }];
    });
}

- (void)hj_setDelegate:(id<UITableViewDelegate>)delegate {
    self.hj_dataPlaceholder.delegate = (id<HJTableViewPlaceholderDelegate>)delegate;
    [self hj_setDelegate:self.hj_dataPlaceholder];
}

- (void)hj_setDataSource:(id<UITableViewDataSource>)dataSource {
    self.hj_dataPlaceholder.dataSource = dataSource;
    [self hj_setDataSource:self.hj_dataPlaceholder];
}

#pragma mark - Property

static char kDataPlaceholder;
static char kPlaceholderViewHeight;

- (void)setHj_dataPlaceholder:(HJTableViewPlaceholder *)hj_dataPlaceholder {
    objc_setAssociatedObject(self, &kDataPlaceholder, hj_dataPlaceholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HJTableViewPlaceholder *)hj_dataPlaceholder {
    HJTableViewPlaceholder *placeholder = objc_getAssociatedObject(self, &kDataPlaceholder);
    if (!placeholder) {
        placeholder = [HJTableViewPlaceholder new];
        [self setHj_dataPlaceholder:placeholder];
    }
    return placeholder;
}

- (void)setHj_placeholderViewHeight:(CGFloat)hj_placeholderViewHeight {
    objc_setAssociatedObject(self, &kPlaceholderViewHeight, @(hj_placeholderViewHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)hj_placeholderViewHeight {
    NSNumber *number = objc_getAssociatedObject(self, &kPlaceholderViewHeight);
    return number ? number.floatValue : 0;
}

@end
