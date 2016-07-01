//
//  Notification.h
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//

#ifndef Notification_h
#define Notification_h

#import <ReactiveCocoa.h>
//#import "SMSystemNavigator.h"

/**
 *  UD用户偏好简单存取操作
 */
#define SMUserDefault               [NSUserDefaults standardUserDefaults]
#define SMUserDefaultSet(key,value) [SMUserDefault setObject:value forKey:key];[SMUserDefault synchronize]
#define SMUserDefaultGet(key)       [SMUserDefault objectForKey:key];

/**
 *  系统通知中心
 */
#define SMNotification [NSNotificationCenter defaultCenter]
#define SMNotificationPost(KEY,OBJ) [SMNotification postNotificationName:KEY object:OBJ]
#define SMNotificationMonitorRACSignal(KEY) [SMNotification rac_addObserverForName:KEY object:nil]


#define SMNotificationKeyLoginSuccess       @"LoginSuccess"         //成功登录通知码
#define SMNotificationKeyFollowGroupSuccess @"GroupFollowSuccess"   //成功关注小组通知码
#define SMNotifiactionKeySupposedToSearch   @"SupposedToSearch"     //待进行搜索


#endif /* Notification_h */
