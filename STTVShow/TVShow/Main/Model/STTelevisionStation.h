//
//  STChannelCategory.h
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "BaseObject.h"
/**
 *  电视台
 */
@interface STTelevisionStation : BaseObject

//电视台ID
@property (nonatomic, copy) NSString *ID;

//电视台名称
@property (nonatomic, copy) NSString *name;


@end
