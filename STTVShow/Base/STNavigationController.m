//
//  STNavigationController.m
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "STNavigationController.h"
#import "MainConfigure.h"

@implementation STNavigationController
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:SM_darkBlueColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:SM_HXBFont(25*2),NSForegroundColorAttributeName:SM_whiteColor}];
}
@end
