//
//  ViewController.m
//  单例Demo
//
//  Created by 骆阳光 on 15/10/31.
//  Copyright © 2015年 骆阳光. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Singleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 30);
    [button setTitle:@"改变" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    Singleton *single = [Singleton shareSingleton];
    
    if ([single.myName length] != 0) {
        
        self.title = single.myName;
        self.view.backgroundColor = single.color;
    }

}

- (void)nextView {

    SecondViewController *vc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
