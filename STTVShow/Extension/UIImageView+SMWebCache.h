//
//  UIImageView+SMWebCache.h
//  Follows
//
//  Created by liangshangjia on 16/5/12.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SMWebCache)
/**
 *  加载图片 成功返回block
 */
- (void)sm_setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)image onComplection:( void (^)(UIImage *image))complection;

/**
 *  sm图片加载
 *  @param url URL地址
 *  @param image 图片对象
 */
- (void)sm_setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)image ;


/**
 *  加载圆形头像方法
 */
- (void)sm_setRoundRectImageWithUrlstr:(NSString *)urlstr
                       withPlaceHolder:(UIImage *)image
                          expiredWidth:(CGFloat)e_width
                                radius:(CGFloat)radius
                           borderWidth:(CGFloat)b_width
                           borderColor:(UIColor *)color;

/**
 *  用七牛图片后缀加载图片(包含placeHolder)
 */
- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr placeHolder:(UIImage *)image ;

/**
 *  用七牛图片后缀加载图片(不包含placeHolder)
 */
- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr ;


/**
 *  加载限宽缩略图（七牛后缀,自定义占位图)
 */
- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr withExpiredWidth:(CGFloat)width placeHolder:(UIImage *)image ;

/**
 *  加载限宽缩略图 (简便使用)
 */
- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr withExpiredWidth:(CGFloat)width;

/**
 *  加载限宽缩略图 (一般使用)
 */
- (void)sm_setThumbImageWithQiniuUrlByTailString:(NSString *)urlStr;

/**
 *  加载限宽头像缩略图 (一般使用)
 */
- (void)sm_setIconImageWithQiniuUrlByTailString:(NSString *)urlStr;


/**
 *  加载限宽缩略图
 */
- (void)sm_setImageWithURLString:(NSString *)urlStr withExpiredWidth:(CGFloat)width;


@end
