//
//  ViewController.m
//  ztrAnnoucenmentViewDemo
//
//  Created by cocomo on 17/1/9.
//  Copyright © 2017年 cocomo. All rights reserved.
//

#import "ViewController.h"
#import "announcementView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    
    UIButton *showButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [showButton setTitle:@"show" forState:UIControlStateNormal];
    [showButton setFrame:CGRectMake(self.view.frame.size.width/2-50, 100, 100, 50)];
    [showButton setBackgroundColor:[UIColor redColor]];
    [showButton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
}
-(void)show
{

    announcementView *anView=[[announcementView alloc]initWithTitle:@"提示" AndContent:@"遇见你是我的小幸运！" AndFrame:CGRectMake(18, 50, kScreenWidth-36, 400)];
    [anView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
