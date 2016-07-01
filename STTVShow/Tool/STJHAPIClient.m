//
//  STJHAPIClient.m
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "STJHAPIClient.h"
#import "JHOpenidSupplier.h"
#import "JHAPISDK.h"

//聚合数据APPKEY
static NSString *JuHeDataAPPKey = @"b5bb8ede0a64207e7559d17009817e2b";
static NSString *JuHeUserOpenID = @"JHc6d30fbe3f86420c6e14a613db43ed02";
static NSString *JuHeAPIDomain  = @"https://japi.juhe.cn";
@implementation STJHAPIClient
+ (void)startup
{
    //绑定聚合数据APPKEY
    [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:JuHeUserOpenID];
}


+ (void)getWithAPITail:(NSString *)tail
                 APIID:(NSString *)apiId
            Parameters:(NSDictionary *)param
               Handler:(STJHAPIClientHandler)handler
{

    [self requestWithAPI:[JuHeAPIDomain stringByAppendingString:tail]
                   APIID:apiId
              Parameters:param
                  Method:@"GET"
                 Handler:handler];
    
}




+ (void)postWithAPITail:(NSString *)tail
                  APIID:(NSString *)apiId
             Parameters:(NSDictionary *)param
                Handler:(STJHAPIClientHandler)handler
{
    [self requestWithAPI:[JuHeAPIDomain stringByAppendingString:tail]
                   APIID:apiId
              Parameters:param
                  Method:@"POST"
                 Handler:handler];
}






+ (void)requestWithAPI:(NSString *)api
                 APIID:(NSString *)apiId
            Parameters:(NSDictionary *)param
                Method:(NSString *)method
               Handler:(STJHAPIClientHandler)handler
{
    [[JHAPISDK shareJHAPISDK]executeWorkWithAPI:api APIID:apiId Parameters:param Method:method Success:^(id responseObject) {
        
        NSUInteger errorCode = [responseObject[@"error_code"] integerValue];
        NSString  *errorMessage = responseObject[@"reason"];
        NSDictionary *responseJsonObject = responseObject[@"result"];
        
        handler(responseJsonObject,errorCode,errorMessage);
        
    } Failure:^(NSError *error) {
        handler(nil,404,@"服务器开小差了");
    }];
}
@end
