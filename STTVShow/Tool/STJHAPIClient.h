//
//  STJHAPIClient.h
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^STJHAPIClientHandler) (NSDictionary *result,NSUInteger errorCode,NSString *errorMessage);


@interface STJHAPIClient : NSObject


/**
 *  启动JHAPIClient
 */
+ (void)startup;



/**
 *  封装JHAPI GET请求
 *
 *  @param tail    API后缀
 *  @param apiId   APIID
 *  @param param   参数
 *  @param handler 回调
 */
+ (void)getWithAPITail:(NSString *)tail
                 APIID:(NSString *)apiId
            Parameters:(NSDictionary *)param
               Handler:(STJHAPIClientHandler)handler;



/**
 *  封装JHAPI POST请求
 *
 *  @param tail    API后缀
 *  @param apiId   APIID
 *  @param param   参数
 *  @param handler 回调
 */
+ (void)postWithAPITail:(NSString *)tail
                  APIID:(NSString *)apiId
             Parameters:(NSDictionary *)param
                Handler:(STJHAPIClientHandler)handler;




/**
 *  封装JHAPI
 *
 *  @param tail    API后缀
 *  @param apiId   APIID
 *  @param param   参数
 *  @param method  方法(GET/POST)
 *  @param handler 回调
 */
+ (void)requestWithAPI:(NSString *)api
                 APIID:(NSString *)apiId
            Parameters:(NSDictionary *)param
                Method:(NSString *)method
               Handler:(STJHAPIClientHandler)handler;
@end
