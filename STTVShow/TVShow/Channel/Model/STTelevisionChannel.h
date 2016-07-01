//
//  STTelevisionChannel.h
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "BaseObject.h"

/**
 *  电视频道
 */
@interface STTelevisionChannel : BaseObject

/*频道名称*/
@property (nonatomic, copy) NSString *channelName;

/*分类id*/
@property (nonatomic, copy) NSString *pId;

/*频道代码*/
@property (nonatomic, copy) NSString *rel;

/*播放链接*/
@property (nonatomic, copy) NSString *url;


@end
