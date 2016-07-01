//
//  SystemMethonHook.h
//  PLMemoryDemo
//
//  Created by Little_F on 16/3/20.
//  Copyright © 2016年 YY_F. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemMethodHook : NSObject

/**
 * 捕获 系统的setTitle方法
 */
+ (void)hookCustomBackTitle;

@end
