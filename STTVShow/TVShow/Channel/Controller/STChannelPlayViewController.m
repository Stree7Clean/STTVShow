//
//  STChannelPlayViewController.m
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "STChannelPlayViewController.h"
#import "STTelevisionChannel.h"
@interface STChannelPlayViewController () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation STChannelPlayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.title = self.channel.channelName;
    
    _webView = [[UIWebView alloc]init];
    NSURL *url = [NSURL URLWithString:_channel.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
    [_webView loadRequest:request];
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.webView.frame = self.view.bounds;
}


#pragma mark - Webview delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request.URL);
    return YES;
}
@end
