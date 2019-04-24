//
//  HJPlaceholderViewUtils.m
//
//  Created by Haijun on 2019/4/24.
//

#import "HJPlaceholderViewUtils.h"
#import "UIView+HJPlaceholderView.h"
#import "HJPlaceholderFadeAnimator.h"

@implementation HJPlaceholderViewUtils

+ (NSBundle *)resourceBundle {
    NSBundle *resourceBundle = nil;
    
    NSBundle *classBundle = [NSBundle bundleForClass:self];
    NSURL *resourceBundleURL = [classBundle URLForResource:@"HJPlaceholderView" withExtension:@"bundle"];
    if (resourceBundleURL) {
        resourceBundle = [[NSBundle alloc] initWithURL:resourceBundleURL];
    } else {
        resourceBundle = classBundle;
    }    
    return resourceBundle;
}

+ (void)applyDefaultResource {
    NSBundle *resourceBundle = [self resourceBundle];
    [UIView appearance].hj_noDataMessageText = NSLocalizedStringFromTableInBundle(@"no data", nil, resourceBundle, nil);
    [UIView appearance].hj_noNetworkMessageText = NSLocalizedStringFromTableInBundle(@"no network", nil, resourceBundle, nil);
    [UIView appearance].hj_noNetworkOperaTitle = NSLocalizedStringFromTableInBundle(@"reload", nil, resourceBundle, nil);
    [UIView appearance].hj_loadingMessageText = NSLocalizedStringFromTableInBundle(@"loading", nil, resourceBundle, nil);
    [UIView appearance].hj_placeholderAnimator = [HJPlaceholderFadeAnimator new];
}

@end
