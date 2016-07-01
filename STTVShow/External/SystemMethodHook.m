//
//  SystemMethonHook.m
//  PLMemoryDemo
//
//  Created by Little_F on 16/3/20.
//  Copyright © 2016年 YY_F. All rights reserved.
//

#import "SystemMethodHook.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@interface UIViewController(Hook)

- (void)setCustomTitle:(NSString *)customTitle;

@end

@implementation UIViewController(Hook)

- (void)setCustomTitle:(NSString *)customTitle
{
    if ([self isKindOfClass:[UIViewController class]] && customTitle.length > 0)
    {
        UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
        backButtonItem.title = @"后退";
        self.navigationItem.backBarButtonItem = backButtonItem;
    }
    [self setCustomTitle:customTitle];
}

@end

@implementation SystemMethodHook

+ (void)hookCustomBackTitle
{
    Method m1 = class_getInstanceMethod([UIViewController class], @selector(setTitle:));
    Method m2 = class_getInstanceMethod([UIViewController class], @selector(setCustomTitle:));
    method_exchangeImplementations(m1, m2);
}

@end
