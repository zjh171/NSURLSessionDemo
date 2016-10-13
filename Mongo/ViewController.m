//
//  ViewController.m
//  Mongo
//
//  Created by zhujinhui on 16/10/12.
//  Copyright © 2016年 kyson. All rights reserved.
//

#import "ViewController.h"
#import "TaskPool.h"

#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 11111;
    btn.frame = CGRectMake(0, 80, 320, 100);
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [btn setTitle:@"进入下一个页面按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    //按钮
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 200, 320, 100);
    [btn2 setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [btn2 setTitle:@"退回上一个页面按钮" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(buttonClicked2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    [self doServiceWithName:SERVICE_DOUSERLOGIN params:nil];
}

- (void)buttonClicked:(id)sender {
    ViewController *vc = [[ViewController alloc] init];
    vc.view.backgroundColor = UIColor.redColor;
    [self presentViewController:vc animated:YES completion:^{
        ;
    }];
}

- (void)buttonClicked2:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


-(void)serviceName:(NSString *)serviceName response:(NetworkResponse *)response{
    
    [super serviceName:serviceName response:response]
    
    ;;
    
    if (response.errorCode == ERRORCODE_NOERROR) {
        User *user = response.responseObject;
        
        NSLog(@"userName:%@",user.userName);
        
        
        
    }
    
    UIButton *btn = [self.view viewWithTag:11111];
    [btn setTitle:@"sdfaasdf" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%@ dealloc",self);
}

@end
