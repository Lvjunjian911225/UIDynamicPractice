//
//  JJListController.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJListController.h"
#import "JJDemoController.h"

@interface JJListController ()

@property (strong,nonatomic) NSArray *behaviorArr;

@end

@implementation JJListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.behaviorArr = @[@"吸附行为",@"推动行为",@"刚性附着行为",@"弹性附着行为",@"碰撞检测"];
    // 设置标题
    self.navigationItem.title = @"仿真行为";
    
    //去掉下面多余的行
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    

}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.behaviorArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.behaviorArr[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JJDemoController * demoVc = [[JJDemoController alloc]init];
    
    demoVc.navigationItem.title = self.behaviorArr[indexPath.row];
    
    demoVc.funcID = (int)indexPath.row;
    
    [self.navigationController pushViewController:demoVc animated:YES];
}














@end
