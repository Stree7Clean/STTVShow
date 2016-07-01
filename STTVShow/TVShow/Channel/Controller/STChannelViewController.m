//
//  STChannelViewController.m
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "STChannelViewController.h"
#import "STChannelPlayViewController.h"
#import "STTelevisionChannel.h"



@interface STChannelViewController ()
@property (nonatomic, strong) NSArray <STTelevisionChannel *>*dataArray;
@end


@implementation STChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.rowHeight      = SM_SIZE(110);
    
    typeof(self) __weak ws = self;
    
    //请求所有的电视台
    [STJHAPIClient getWithAPITail:@"/tv/getChannel"
                            APIID:@"129"
                       Parameters:@{@"pId":_pId}
                          Handler:^(NSDictionary *result, NSUInteger errorCode, NSString *errorMessage) {
                              
                              ws.dataArray = [STTelevisionChannel mj_objectArrayWithKeyValuesArray:result];
                              [ws.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                                          withRowAnimation:UITableViewRowAnimationFade];
                              
                          }];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellID = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataArray[indexPath.row].channelName;
    cell.detailTextLabel.text = self.dataArray[indexPath.row].rel;
    cell.detailTextLabel.textColor = SM_grayColor;
    cell.textLabel.font = SM_HXBFont(34);
    cell.detailTextLabel.font = SM_HXBFont(29);
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:[STChannelPlayViewController storyboardPushSegueID] sender:self.dataArray[indexPath.row]];
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    STChannelPlayViewController *channelDVC = segue.destinationViewController;
    STTelevisionChannel *channel = sender;
    channelDVC.channel = channel;
}

@end