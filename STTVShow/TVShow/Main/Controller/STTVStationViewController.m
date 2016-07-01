//
//  ViewController.m
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "STTVStationViewController.h"
#import "STChannelViewController.h"
#import "STTelevisionStation.h"

@interface STTVStationViewController ()
@property (nonatomic, strong) NSArray <STTelevisionStation *>*dataArray;
@end

@implementation STTVStationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.rowHeight      = SM_SIZE(100);
    
    typeof(self) __weak ws = self;
    
    //请求所有的电视台
    [STJHAPIClient getWithAPITail:@"/tv/getCategory"
                            APIID:@"129"
                       Parameters:nil
                          Handler:^(NSDictionary *result, NSUInteger errorCode, NSString *errorMessage) {
                              
                              ws.dataArray = [STTelevisionStation mj_objectArrayWithKeyValuesArray:result];
                              [ws.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                                          withRowAnimation:UITableViewRowAnimationFade];
                              
                          }];
    
    [STJHAPIClient requestWithAPI:@"http://op.juhe.cn/onebox/movie/pmovie" APIID:@"94" Parameters:@{@"city":@"广州"} Method:@"GET" Handler:^(NSDictionary *result, NSUInteger errorCode, NSString *errorMessage) {
        
    }];
    

}


#pragma mark - TableView delegate && datasource

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
    cell.textLabel.text = self.dataArray[indexPath.row].name;
    cell.textLabel.font = SM_HXBFont(34);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:[STChannelViewController storyboardPushSegueID] sender:self.dataArray[indexPath.row]];
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    STChannelViewController *channelVC = segue.destinationViewController;
    STTelevisionStation *station = sender;
    channelVC.pId = station.ID;
    channelVC.title = station.name;
}


@end
