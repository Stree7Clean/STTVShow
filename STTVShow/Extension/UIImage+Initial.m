//
//  UIImage+Initial.m
//  ST_Demos
//
//  Created by 梁尚嘉 on 16/4/9.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "UIImage+Initial.h"

@implementation UIImage (Initial)

+ (instancetype)pngNamed:(NSString *)aName
{
    return [self st_imageNamed:[aName stringByAppendingString:[self suffixName]] type:@"png"];
}

+ (instancetype)jpgNamed:(NSString *)aName
{
    return [self st_imageNamed:[aName stringByAppendingString:[self suffixName]] type:@"jpg"];
}

+ (instancetype)st_imageNamed:(NSString *)aName type:(NSString *)aType
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:aName ofType:aType];
    return [UIImage imageWithContentsOfFile:imagePath];
}

+ (NSString *)suffixName
{
    switch ((int)[UIScreen mainScreen].nativeScale) {
        case 1:
            return @"";
            break;
            
        case 2:
            return @"@2x";
            break;
            
        case 3:
            return @"@3x";
            break;
            
        default:
            break;
    }
    return  @"";
}

@end
