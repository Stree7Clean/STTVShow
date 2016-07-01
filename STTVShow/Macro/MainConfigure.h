//
//  MainConfigure.h
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//


#ifndef MainConfigure_h
#define MainConfigure_h

#import "MainAppearance.h"
#import "Notification.h"
#import "UIFont+SM_Ext.h"
#import "UIColor+Ext.h"
#import "UIImage+Color.h"
#import "UIImage+Initial.h"
#import <Masonry.h>
#import <MJExtension.h>
#import "UIScrollView+EmptyDataSet.h"
#import "UIImageView+SMWebCache.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "STJHAPIClient.h"

/**
 *  自定义NSLog打印(release模式下关闭)
 */
#ifdef DEBUG

    #define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else

    #define NSLog(FORMAT, ...) nil

#endif





#endif /* MainConfigure_h */
