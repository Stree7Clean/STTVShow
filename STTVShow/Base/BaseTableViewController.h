//
//  BaseTableViewController.h
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource> {
    UITableView *_tableView;
}

- (instancetype)initWithType:(UITableViewStyle)style;

@property (nonatomic, strong, readonly) UITableView *tableView;

@end
