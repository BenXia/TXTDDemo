//
//  MyMessgaeVC.m
//  TXTDDemo
//
//  Created by 王涛 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "MyMessgaeVC.h"
#import "MessageCell.h"

@interface MyMessgaeVC ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyMessgaeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的消息";
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Private Method

- (void)initTableView {
    [self.tableView registerNib:[MessageCell nib] forCellReuseIdentifier:[MessageCell identifier]];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[MessageCell identifier] forIndexPath:indexPath];
    if (indexPath.section == 1) {
        cell.titleLabel.text = @"中国农业银行";
        cell.detailLabel.text = @"中国农业银行的系统消息中国农业银行的系统消息中国农业银行的系统消息中国农业银行的系统消息";
    } else if (indexPath.section == 2) {
        cell.titleLabel.text = @"中国招商银行";
        cell.detailLabel.text = @"中国招商银行的系统消息中国招商银行的系统消息中国农业银行的系统消息中国农业银行的系统消息";
    } else if (indexPath.section == 3) {
        cell.titleLabel.text = @"花旗银行";
        cell.detailLabel.text = @"花旗银行的系统消息花旗银行的系统消息中国农业银行的系统消息中国农业银行的系统消息";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

@end
