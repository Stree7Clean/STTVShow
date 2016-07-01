//
//  UIImageView+SMWebCache.m
//  Follows
//
//  Created by liangshangjia on 16/5/12.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//

#import "UIImageView+SMWebCache.h"
#import <YYWebImage.h>
#import "MainConfigure.h"

@implementation UIImageView (SMWebCache)

- (void)sm_setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)placeHolder radius:(CGFloat)radius borderWidth:(CGFloat)b_width borderColor:(UIColor *)color onComplection:( void (^)(UIImage *image))complection {
    [self yy_setImageWithURL:url placeholder:placeHolder options:YYWebImageOptionSetImageWithFadeAnimation progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        NSLog(@"%ld",(long)receivedSize);
    } transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        return radius ? [image yy_imageByRoundCornerRadius:radius borderWidth:b_width borderColor:color] : image;
    } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {

    }];
}


- (void)sm_setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)placeHolder onComplection:( void (^)(UIImage *image))complection {
    
    
    [self sm_setImageWithUrl:url placeHolder:placeHolder radius:0 borderWidth:0 borderColor:nil onComplection:nil];

}

- (void)sm_setRoundRectImageWithUrlstr:(NSString *)urlstr
                       withPlaceHolder:(UIImage *)image
                          expiredWidth:(CGFloat)e_width
                                radius:(CGFloat)radius
                           borderWidth:(CGFloat)b_width
                           borderColor:(UIColor *)color
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?imageMogr2/thumbnail/%.2fx",QIUNIU_DOMAIN,urlstr,THUMBNAIL_WIDTH(e_width)]];
    [self sm_setImageWithUrl:url placeHolder:image radius:radius borderWidth:b_width borderColor:color onComplection:nil];
}

- (void)sm_setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)image {
    [self sm_setImageWithUrl:url placeHolder:image onComplection:nil];
}

- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr placeHolder:(UIImage *)image {
    [self sm_setImageWithUrl:QINIU_IMAGE_URL(urlStr) placeHolder:image];
}

- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr {
    [self sm_setImageWithQiniuUrlByTailString:urlStr placeHolder:nil];
}

- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr withExpiredWidth:(CGFloat)width placeHolder:(UIImage *)image {
    NSString *totalStr = nil;
    if ([urlStr rangeOfString:@"?"].length) {
        NSRange range = [urlStr rangeOfString:@"?"];
        urlStr = [urlStr substringToIndex:range.location];
    }
    totalStr = [NSString stringWithFormat:@"%@?imageMogr2/thumbnail/%.2fx",QINIU_IMAGE_URL(urlStr),width];
    NSURL *url = [NSURL URLWithString:totalStr];
    [self sm_setImageWithUrl:url placeHolder:image];
}

- (void)sm_setImageWithQiniuUrlByTailString:(NSString *)urlStr withExpiredWidth:(CGFloat)width {
    [self sm_setImageWithQiniuUrlByTailString:urlStr withExpiredWidth:width placeHolder:LOGO_IMAGE];
}

/**
 *  加载限宽缩略图 (一般使用)
 */
- (void)sm_setThumbImageWithQiniuUrlByTailString:(NSString *)urlStr
{
    [self sm_setImageWithQiniuUrlByTailString:urlStr withExpiredWidth:300];
}

/**
 *  加载限宽头像缩略图 (一般使用)
 */
- (void)sm_setIconImageWithQiniuUrlByTailString:(NSString *)urlStr
{
    [self sm_setImageWithQiniuUrlByTailString:urlStr withExpiredWidth:90];
}

- (void)sm_setImageWithURLString:(NSString *)urlStr withExpiredWidth:(CGFloat)width {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?imageMogr2/thumbnail/%.2fx",QIUNIU_DOMAIN,urlStr,width] ];
//    if (url == nil) {
//        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?imageMogr2/thumbnail/%.2fx",QIUNIU_DOMAIN,[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],width] ];
//    }
    [self sm_setImageWithUrl:url  placeHolder:LOGO_IMAGE];
}
@end
