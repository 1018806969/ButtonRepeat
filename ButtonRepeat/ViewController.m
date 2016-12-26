//
//  ViewController.m
//  ButtonRepeat
//
//  Created by txx on 16/12/26.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+Repeat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(100, 100, 100, 40);
    testBtn.backgroundColor = [UIColor greenColor];
    [testBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    testBtn.acceptEventInterval = 2;
    [self.view addSubview:testBtn];
}
-(void)click:(UIButton *)btn
{
    NSLog(@"click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
