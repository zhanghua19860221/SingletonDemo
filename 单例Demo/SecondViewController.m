//
//  SecondViewController.m
//  单例Demo
//
//  Created by 骆阳光 on 15/11/2.
//  Copyright © 2015年 骆阳光. All rights reserved.
//

#import "SecondViewController.h"
#import "Singleton.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate> {

    UITableView *_tableView;

}

@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) NSArray * colorArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.dataArray = @[@"橙色",@"紫色",@"红色",@"黄色",@"蓝色",@"随机色"];
    
    self.colorArray = @[[UIColor orangeColor], [UIColor purpleColor], [UIColor redColor], [UIColor yellowColor], [UIColor blueColor], [UIColor colorWithRed:arc4random()%255/256.f green:arc4random()%255/256.f blue:arc4random()%255/256.f alpha:1]];
    [self createTableView];
}

- (void)createTableView {

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count;
}


//tableView点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Singleton *single = [Singleton shareSingleton];
    single.myName = self.dataArray[indexPath.row];
    single.color = self.colorArray[indexPath.row];
        
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
