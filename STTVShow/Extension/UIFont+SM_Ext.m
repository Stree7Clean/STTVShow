//
//  UIFont+SM_Ext.m
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//

#import "UIFont+SM_Ext.h"

@implementation UIFont (SM_Ext)

+ (UIFont *)customFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:size];
}

+ (UIFont *)customBoldFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"FZLTHJW--GB1-0" size:size];
}

+ (UIFont *)huxiaoBoFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"huxiaobo-meixin" size:size];
}
@end
