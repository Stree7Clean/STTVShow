//
//  BaseViewController.m
//  STTVShow
//
//  Created by liangshangjia on 16/7/1.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.navigationController.viewControllers.count > 1) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"]
                                                                                style:UIBarButtonItemStylePlain
                                                                               target:self
                                                                               action:@selector(backAction:)];
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)backAction:(id)sender
{
    if (self.navigationController.viewControllers.count > 1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        if (self.navigationController)
        {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}


+ (NSString *)storyboardPushSegueID
{
    return [NSStringFromClass(self) stringByAppendingString:@"_PUSH"];
}

+ (NSString *)storyboardPresentSegueID
{
    return [NSStringFromClass(self) stringByAppendingString:@"_PRESENT"];
}


- (void)dealloc
{
    NSLog(@"%@ dealloc",[self class]);
}
@end
